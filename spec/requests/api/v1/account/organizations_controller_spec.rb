require "rails_helper"

RSpec.describe Api::V1::Account::OrganizationsController, type: :request do
  describe 'GET #index' do
    before do
      organizations

      get '/api/v1/account/organizations', **auth_header
    end

    let!(:organizations) { FactoryBot.create_list(:organization, 3, owner: current_user) }
    let!(:organizations_response) do
      organizations_list = organizations.map do |organization|
        {
          id: organization.id.to_s,
          type: 'organization',
          attributes: {
            id: organization.id,
            name: organization.name
          }
        }
      end

      {
        data: organizations_list
      }.deep_stringify_keys
    end

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'matches response' do
      expect(JSON.parse(response.body)).to eq(organizations_response)
    end
  end

  describe 'POST #create' do
    subject do
      post '/api/v1/account/organizations',
           params: request_params, **auth_header
    end

    context 'with valid params' do
      let!(:request_params) { { organization: attributes_for(:organization) } }

      def organization_response(organization)
        {
          data: {
            id: organization.id.to_s,
            type: 'organization',
            attributes: {
              id: organization.id,
              name: organization.name
            }
          }
        }.deep_stringify_keys
      end

      it 'returns status - created' do
        subject
        expect(response).to have_http_status(201)
      end

      it 'creates new organization' do
        expect { subject }.to change(Organization, :count).by(1)
      end

      it 'matches the response' do
        subject
        expect(JSON.parse(response.body)).to eq(organization_response(current_user.organizations.last))
      end
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
