require 'swagger_helper'

RSpec.describe '/api/v1/account/organizations', type: :request do
  path '/api/v1/account/organizations' do
    get 'List of Organizations' do
      tags 'Organization'
      consumes 'applicatoin/json'
      parameter name: :Authorization, in: :header, type: :string

      response 200, 'ok' do
        let(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.token }

        examples 'application/json' => organizations_response

        run_test!
      end
    end
  end

  path '/api/v1/account/organizations' do
    post 'Create Organization' do
      tags 'Organization'
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
