# app/models/user.rb
class User < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :links, dependent: :destroy
  # sth

  friendly_id :username, use: %i[slugged]

  validates :full_name, length: { maximum: 40 }
  validates :body, length: { maximum: 150 }
  validate :valid_username

  def valid_username
    errors.add(:username, 'is already taken 🤷‍♀️') if User.exists?(username:)

    restricted_username_list = %(index admin root dashboard analytics appearance settings preferances calendar)
    errors.add(:username, 'is restricted 🙅‍♀️') if restricted_username_list.include?(username)
  end

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  def missing_links
    final_links = []
    links_difference = Link::LINK_LIMIT - links.length
    links_difference.times do
      final_links << Link.new
    end
    final_links
  end
end
