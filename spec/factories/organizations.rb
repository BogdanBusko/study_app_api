# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  logo       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_organizations_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
FactoryBot.define do
  factory :organization do
    association :author, factory: :user

    name { Faker::Lorem.sentence }
    logo { nil }
  end
end
