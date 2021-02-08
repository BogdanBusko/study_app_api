# == Schema Information
#
# Table name: user_organizations
#
#  id              :bigint           not null, primary key
#  role            :string           default("member")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_user_organizations_on_organization_id  (organization_id)
#  index_user_organizations_on_role             (role)
#  index_user_organizations_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (user_id => users.id)
#
class UserOrganization < ApplicationRecord
  MEMBER = 'member'.freeze

  ROLES = [MEMBER].freeze

  belongs_to :user
  belongs_to :organization

  validates :role, inclusion: { in: ROLES }
end
