# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  logo       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint
#
# Indexes
#
#  index_organizations_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:owner).class_name('User') }
    it { is_expected.to have_many(:user_organizations) }
    it { is_expected.to have_many(:users).through(:user_organizations) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'callbacks' do
    let!(:user) { create(:user) }

    describe '.add_organization_owner' do
      it 'add user as organization owner after creating organization' do
        user_organization = nil

        expect do
          user_organization = FactoryBot.create(:organization, owner: user)
                                .user_organizations.find_by(user_id: user.id)
        end.to change(UserOrganization, :count).by(1)
        expect(user_organization.role).to eq(UserOrganization::OWNER)
      end
    end
  end
end
