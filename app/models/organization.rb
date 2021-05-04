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
class Organization < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_organizations
  has_many :users, through: :user_organizations

  validates :name, presence: true

  after_create :add_organization_owner

  private

  def add_organization_owner
    self.user_organizations.create(user: self.owner, role: UserOrganization::OWNER)
  end
end
