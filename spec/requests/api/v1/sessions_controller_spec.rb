require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :request do
  let!(:user) { create(:user, password: '123456') }

  describe 'POST #create' do
    before do
      post '/api/v1/sessions', params: params
    end
    let!(:params) do
      {
        session: {
          email: user_email,
          password: user_password
        }
      }
    end

    subject { response }

    context 'with invalid password' do
      let!(:user_email) { user.email }
      let!(:user_password) { '12345' }

      it { is_expected.to have_http_status(401) }
    end

    context 'with valid params' do
      let!(:user_email) { user.email }
      let!(:user_password) { '123456' }

      it { is_expected.to have_http_status(201) }

      it 'returns user token' do
        expect(JSON.parse(subject.body)['data']['attributes']['token']).to_not be_nil
      end
    end

    context 'with invalid email' do
      let!(:user_email) { 'john.doe@email.com' }
      let!(:user_password) { '123456' }

      it { is_expected.to have_http_status(401) }
    end
  end
end
