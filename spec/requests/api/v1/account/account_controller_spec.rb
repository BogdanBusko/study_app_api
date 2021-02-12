require "rails_helper"

RSpec.describe Api::V1::Account::AccountController do
  context 'check authenticate_user! callback' do
    before do
      get '/api/v1/account/profiles', options
    end

    subject { response }

    context 'with valid token' do
      let!(:options) { { headers: { 'Authorization': user.token } } }
      let!(:user) { create(:user) }

      it { is_expected.to be_successful }
    end

    context 'with invalid token' do
      let!(:options) { { headers: { 'Authorization': SecureRandom.hex(10) } } }

      it { is_expected.to be_unauthorized }
    end

    context 'without token' do
      let!(:options) { { } }

      it { is_expected.to be_unauthorized }
    end
  end
end
