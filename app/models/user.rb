# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
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
#  index_users_on_role                  (role)
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ADMIN = 'admin'.freeze
  USER = 'user'.freeze
  ROLES = [USER, ADMIN].freeze

  has_many :own_organizations, foreign_key: 'author_id', class_name: 'Organization'

  validates :first_name, :last_name, presence: true

  def update_token!
    token = SecureRandom.uuid

    set_token! if User.find_by(token: token).present?

    update(token: token)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def token
    JsonWebToken.encode(id)
  end
end
