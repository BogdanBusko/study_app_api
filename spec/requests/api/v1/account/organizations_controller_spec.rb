require "rails_helper"

RSpec.describe Api::V1::Account::OrganizationsController, type: :request do
  let!(:user) { create(:user) }

  describe 'POST #create' do
    it 'creates organization' do
      expect do
        post '/api/v1/account/organizations', params: {
          organization: attributes_for(:organization)
        }, headers: { 'Authorization': user.token }
      end.to change(Organization, :count).by(1)

      expect(response).to have_http_status(204)
    end

    it 'returns errors if some of params is invalid' do
      post '/api/v1/account/organizations', params: {
        organization: {
          name: nil
        }
      }, headers: { 'Authorization': user.token }

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)['data']['attributes']['errors'].count).to eq(1)
    end
  end
end
