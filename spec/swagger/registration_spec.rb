require 'swagger_helper'

RSpec.describe 'api/v1/registration', type: :request do
  path '/api/v1/registration' do
    post 'create registration'  do
      tags 'Registration'
      consumes 'application/json'
      parameter name: :registration, in: :body, schema: {
                  type: :object,
                  properties: {
                    registration: {
                      type: :object,
                      properties: {
                        first_name: { type: :string },
                        last_name: { type: :string },
                        email: { type: :string },
                        password: { type: :string },
                        password_confirmation: { type: :string }
                      }
                    }
                  }
                }
      examples 'application/json' => {
                 registration: {
                   first_name: 'John Doe'
                 }
               }

      response 200, 'successful' do
        let(:registration) { attributes_for(:user) }

        examples 'application/json' => {
                   data: {
                     id: 1,
                     type: 'registration',
                     attributes: auth_response
                   }
                 }

        run_test!
      end

      response
    end
  end
end
