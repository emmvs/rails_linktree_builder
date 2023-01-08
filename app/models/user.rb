# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  validates :full_name, length: { maximum: 40 }
  validates :body, length: { maximum: 150 }
  validate :valid_username

  def valid_username
    errors.add(:username, 'is already taken 🤷‍♀️') if User.exists?(username:)

    restricted_username_list = %(admin root dashboard analytics appearance settings preferances calendar)

    errors.add(:username, 'is restricted') if restricted_username_list.include?(username)
  end
end
