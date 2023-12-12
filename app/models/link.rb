# app/models/link.rb
class Link < ApplicationRecord
  LINK_LIMIT = 5

  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
end
