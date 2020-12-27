require "rails_helper"

RSpec.describe Api::V1::RegistrationController do
  describe 'POST #create' do
    it 'register new user' do
      expect do
        post '/api/v1/registration', params: {
          user: attributes_for(:user)
        }
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(200)
    end

    it 'returns errors if data is not valid' do
      expect do
        post '/api/v1/registration', params: {
          user: {
            first_name: '',
            last_name: '',
            password: SecureRandom.hex(10),
            email: Faker::Internet.email
          }
        }
      end.to change(User, :count).by(0)

      expect(JSON.parse(response.body)['data']['attributes']['errors'].count).to eq(2)
      expect(response).to have_http_status(400)
    end
  end
end
