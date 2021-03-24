require 'swagger_helper'

RSpec.describe 'SessionsController', type: :request do
  let!(:user) { create(:user, password: '123456') }

  path '/api/v1/sessions' do
    post 'Sign In' do
      tags 'Session'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
                  type: :object,
                  properties: {
                    session: {
                      type: :object,
                      properties: {
                        email: { type: :string },
                        password: { type: :string }
                      },
                      required: [:email, :password]
                    }
                  },
                  required: [:session]
                }

      response 201, 'session created' do
        let(:session) { { email: user.email, password: '123456' } }

        examples 'application/json' => {
                   data: {
                     id: 1,
                     type: 'session',
                     attributes: auth_response
                   }
                 }

        run_test!
      end

      response 401, 'unauthorized' do
        let(:session) { { email: 'test@email.com', password: '213515' } }

        run_test!
      end
    end
  end
end
