require 'rails_helper'
require 'json_web_token'

RSpec.describe JsonWebToken do
  let!(:user) { create(:user) }

  describe '.encode' do
    subject { JsonWebToken.encode(user.id) }

    it 'converts user ID in to token' do
      is_expected.to_not be_nil
      is_expected.to_not eq(user.id)
    end
  end

  describe '.decode' do
    let!(:token) { JsonWebToken.encode(user.id) }

    it 'returns decoded token' do
      expect(JsonWebToken.decode(token)).to eq(user.id)
    end

    it 'returns nil if user token is invalid' do
      expect(JsonWebToken.decode(SecureRandom.hex(16))).to eq(nil)
    end
  end
end
