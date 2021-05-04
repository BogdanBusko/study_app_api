# == Schema Information
#
# Table name: user_organizations
#
#  id              :bigint           not null, primary key
#  role            :string           default("member")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_user_organizations_on_organization_id  (organization_id)
#  index_user_organizations_on_user_id          (user_id)
#
require 'rails_helper'

RSpec.describe UserOrganization, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:organization) }
  end

  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:role).in_array(UserOrganization::ROLES) }
  end
end
