# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  password_digest        :string           default(""), not null
#  photo                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:own_organizations).with_foreign_key(:author_id).class_name('Organization') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('john.doe@email.com').for(:email) }
    it { is_expected.to_not allow_value('john.doeemail.com').for(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to validate_length_of(:password).is_at_most(16) }
  end

  describe 'methods' do
   let!(:user) { create(:user) }

    describe '#full_name' do
      it 'returns user full_name' do
        expect(user.full_name).to eq([user.first_name, user.last_name].join(' '))
      end
    end

    describe '#token' do
      it 'returns user id as encoded token' do
        expect(user.token).to_not be_nil
      end
    end
  end
end
