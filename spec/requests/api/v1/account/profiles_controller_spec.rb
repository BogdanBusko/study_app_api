require "rails_helper"

RSpec.describe Api::V1::Account::ProfilesController do
  let!(:user) { create(:user) }

  describe 'GET #show' do
    let!(:user_response) do
      {
        data: {
          type: 'user',
          id: user.id.to_s,
          attributes: {
            first_name: user.first_name,
            last_name: user.last_name,
            full_name: user.full_name
          }
        }
      }.deep_stringify_keys
    end

    before do
      get '/api/v1/account/profiles', headers: { 'Authorization': user.token }
    end

    subject { response }

    it { is_expected.to be_successful }
    it { expect(JSON.parse(subject.body)).to eq(user_response) }
  end
end
