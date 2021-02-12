require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :request do
  let!(:user) { create(:user, password: '123456') }

  describe 'POST #create' do
    before do
      post '/api/v1/sessions', params: params
    end

    subject { response }

    context 'with invalid params' do
      let!(:params) do
        {
          session: {
            email: user.email,
            password: '12356'
          }
        }
      end

      it { is_expected.to have_http_status(401) }
    end

    context 'with valid params' do
      let!(:params) do
        {
          session: {
            email: user.email,
            password: '123456'
          }
        }
      end

      it { is_expected.to have_http_status(201) }

      it 'returns user token if credentials valid' do
        expect(JSON.parse(subject.body)['data']['attributes']['token']).to_not be_nil
      end
    end
  end
end
