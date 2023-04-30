# app/models/link.rb
class Link < ApplicationRecord
  LINK_LIMIT = 5

  validates :title, presence: true
  validates :url, presence: true

  belongs_to :user
end
