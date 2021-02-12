require 'rails_helper'
require 'json_web_token'

RSpec.describe JsonWebToken do
  let!(:user) { create(:user) }

  describe '.encode' do
    subject { JsonWebToken.encode(user.id) }

    it { is_expected.to_not be_nil }
    it { is_expected.to_not eq(user.id) }
  end

  describe '.decode' do
    subject { JsonWebToken.decode(token) }

    context 'with valid token' do
      let!(:token) { JsonWebToken.encode(user.id) }

      it { is_expected.to eq(user.id) }
    end

    context 'with invalid token' do
      let!(:token) { SecureRandom.hex(16) }

      it { is_expected.to be_nil }
    end
  end
end
