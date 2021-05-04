require "rails_helper"

RSpec.describe Api::V1::Account::ProfilesController do
  let!(:user) { create(:user) }
  let!(:user_response) do
    {
      data: {
        type: 'profile',
        id: user.id.to_s,
        attributes: {
          first_name: user.first_name,
          last_name: user.last_name,
          full_name: user.full_name,
          email: user.email
        }
      }
    }.deep_stringify_keys
  end

  describe 'GET #show' do
    before do
      get '/api/v1/account/profile', headers: { 'Authorization': user.token }
    end

    subject { response }

    it { is_expected.to be_successful }
    it { expect(JSON.parse(subject.body)).to eq(user_response) }
  end

  describe 'PATCH #update' do
    subject do
      patch '/api/v1/account/profile', params: {
              user: {
                first_name: 'Jack',
                last_name: 'Simpson',
                email: 'jack.simpson@email.com'
              }
            }, headers: { 'Authorization': user.token }
    end

    it 'updates user data' do
      expect do
        subject
        user.reload
      end.to change(user, :first_name)
               .and(change(user, :last_name))
               .and(change(user, :email))
    end
  end
end
