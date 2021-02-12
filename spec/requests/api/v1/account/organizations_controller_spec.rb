require "rails_helper"

RSpec.describe Api::V1::Account::OrganizationsController, type: :request do
  let!(:user) { create(:user) }

  describe 'POST #create' do
    subject do
      post '/api/v1/account/organizations',
           params: request_params,
           headers: { 'Authorization': user.token }
    end

    context 'with valid params' do
      let!(:request_params) { { organization: attributes_for(:organization) } }

      it 'returns no content status' do
        subject
        expect(response).to have_http_status(204)
      end

      it { expect { subject }.to change(Organization, :count).by(1) }
    end

    context 'with invalid params' do
      let!(:request_params) { { organization: attributes_for(:organization, name: nil) } }

      it 'returns unprocessible entity status' do
        subject
        expect(response).to have_http_status(422)
      end

      it { expect { subject }.to change(Organization, :count).by(0) }

      it 'returns errors' do
        subject
        expect(JSON.parse(response.body)['data']['attributes']['errors'].count).to eq(1)
      end
    end
  end
end
