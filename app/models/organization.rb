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
class Organization < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
end
