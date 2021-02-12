require "rails_helper"

RSpec.describe Api::V1::RegistrationController do
  describe 'POST #create' do
    subject { post '/api/v1/registration', params: params }

    context 'with valid params' do
      let(:params) { { user: attributes_for(:user) } }

      it 'returns status accepted' do
        subject

        expect(response).to have_http_status(201)
      end

      it 'creates user' do
        expect { subject }.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:params) { { user: attributes_for(:user, first_name: nil, last_name: nil) } }

      it 'returns status accepted' do
        subject

        expect(response).to have_http_status(422)
      end

      it 'creates user' do
        expect { subject }.to change(User, :count).by(0)
      end

      it 'returns 2 errors' do
        subject

        expect(JSON.parse(response.body)['data']['attributes']['errors'].count).to eq(2)
      end
    end
  end
end
