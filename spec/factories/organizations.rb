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
FactoryBot.define do
  factory :organization do
    association :owner, factory: :user

    name { Faker::Lorem.sentence }
    logo { nil }
  end
end
