require "rails_helper"
require "auth_session"
require "json_web_token"

RSpec.describe AuthSession do
  let!(:request) { double('request') }

  before do
    allow(request).to receive(:headers).and_return({ 'Authorization': token }.stringify_keys)
  end

  describe '#user_id' do
    subject { AuthSession.new(request).user_id }

    context 'with valid token' do
      let!(:token) { JsonWebToken.encode({ user_id: 1 }) }

      it { is_expected.to eq(1) }
    end

    context 'with invalid token' do
      let!(:token) { SecureRandom.hex(10) }

      it { is_expected.to be_nil }
    end
  end
end
