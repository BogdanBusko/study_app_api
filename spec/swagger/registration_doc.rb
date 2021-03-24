require 'swagger_helper'

RSpec.describe '/api/v1/registration', type: :request do
  path '/api/v1/registration' do
    post 'Sign Up' do
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

      response 201, 'created' do
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

      response 422, 'Unprocessable Entity' do
        let(:registration) do
          {
            first_name: nil,
            last_name: nil,
            email: nil,
            password: nil,
            password_confirmation: nil
          }
        end

        examples 'application/json' => error_response_for(:registration)

        run_test!
      end
    end
  end
end
