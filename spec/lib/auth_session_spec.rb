require "rails_helper"
require "auth_session"
require "json_web_token"

RSpec.describe AuthSession do
  let!(:request) { double('request') }

  before do
    token = JsonWebToken.encode({ user_id: 1 })
    allow(request).to receive(:headers).and_return({ 'Authorization': token }.stringify_keys)
  end

  describe '#user_id' do
    it 'returns user id' do
      expect(AuthSession.new(request).user_id).to eq(1)
    end
  end
end
