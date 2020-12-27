require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :request do
  let!(:user) { create(:user, password: '123456', token: SecureRandom.uuid) }

  describe 'POST #create' do
    it 'returns status 401 if some of credentials is invalid' do
      post '/api/v1/sessions', params: {
             email: user.email,
             password: '12356'
           }

      expect(response).to have_http_status(401)
    end

    it 'returns user token if credentials valid' do
      post '/api/v1/sessions', params: {
             email: user.email,
             password: '123456'
           }
    end
  end

  describe 'DELETE #destroy' do
    it 'returns status 401 if user token is invalid' do
      delete '/api/v1/sessions', headers: { "Authorization" => SecureRandom.uuid }

      expect(response).to have_http_status(401)
    end

    it 'updates user token' do
      expect do
        delete '/api/v1/sessions', headers: { "Authorization" => "Bearer #{user.token}" }
        user.reload
      end.to change(user, :token)

      expect(response).to have_http_status(200)
    end
  end
end
