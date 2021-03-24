require 'swagger_helper'

RSpec.describe '/api/v1/account/profile', type: :request do
  path '/api/v1/account/profile' do
    get 'Profile' do
      tags 'User profile'
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
  end
end
