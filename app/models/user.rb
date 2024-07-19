# frozen_string_literal: true

class User < ApplicationRecord
  RESTRICTED_USERNAMES = %w[admin index root dashboard analytics appearance settings preferences calendar].freeze

  extend FriendlyId

  # Devise Modules
  # TODO: Enable :confirmable for email verification
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one_attached :avatar
  has_one :linktree_customization
  accepts_nested_attributes_for :linktree_customization
  has_many :links, dependent: :destroy

  # URL Slugg Library
  # https://emma.com/blog/this-is-a-url-slug/
  friendly_id :username, use: %i[slugged]

  # Validations
  # TODO: Add more robust validations for username (format, uniqueness, etc.)
  validates :full_name, length: { maximum: 40 }
  validates :body, length: { maximum: 150 }
  validate :valid_username

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  # Returns an array of placeholder Link objects to fill up to the LINK_LIMIT for the user
  #
  # This method ensures that the user's dashboard always displays a fixed number of link input forms.
  # It calculates the difference between the current number of links and the maximum allowed (Link::LINK_LIMIT),
  # and generates new, unsaved Link objects to make up this difference. These placeholders are used for rendering
  # additional input forms on the dashboard, allowing users to add new links up to the limit.
  #
  # @return [Array<Link>] An array of new, unsaved Link objects
  def missing_links
    final_links = []
    links_difference = Link::LINK_LIMIT - links.length
    links_difference.times do
      final_links << Link.new
    end
    final_links
  end

  private

  def valid_username
    errors.add(:username, 'is already taken 🤷‍♀️') if User.where.not(id:).exists?(username:)
    errors.add(:username, 'is restricted 🙅‍♀️') if RESTRICTED_USERNAMES.include?(username)
  end
end
