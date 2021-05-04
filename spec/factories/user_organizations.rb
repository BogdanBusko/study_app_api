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
FactoryBot.define do
  factory :user_organization do
    association :user
    association :organization
  end
end
