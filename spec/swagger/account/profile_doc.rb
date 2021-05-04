require 'swagger_helper'

RSpec.describe '/api/v1/account/profile', type: :request do
  path '/api/v1/account/profile' do
    get 'User profile' do
      tags 'Profile'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response 200, 'ok' do
        let(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.token }

        examples 'application/json' => profile_response

        run_test!
      end

      response 401, 'unauthorized' do
        run_test!
      end
    end

    patch 'Update user profile' do
      tags 'Profile'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :user, in: :body, schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        first_name: { type: :string },
                        last_name: { type: :string },
                        email: { type: :string }
                      }
                    }
                  }
                }

      response 200, 'profile updated' do
        let(:user) do
          {
            user: {
              first_name: 'Jack',
              last_name: 'Jackson',
              email: 'jack.jackson@email.com'
            }
          }
        end
        let(:Authorization) { 'Bearer ' + user.token }

        examples 'application/json' => profile_response

        run_test!
      end

      response 422, 'unprocessable entity' do
        let(:user) do
          {
            user: {
              first_name: nil,
              last_name: 'Jackson',
              email: 'jack.jackson@email.com'
            }
          }
        end

        examples 'application/json' => error_response_for(:profile)

        run_test!
      end

      response 401, 'unauthorized' do
        run_test!
      end
    end
  end
end
