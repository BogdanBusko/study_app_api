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
class UserOrganization < ApplicationRecord
  OWNER = 'owner'
  MEMBER = 'member'

  ROLES = [OWNER, MEMBER]

  belongs_to :user
  belongs_to :organization

  validates :role, inclusion: { in: ROLES }
end
