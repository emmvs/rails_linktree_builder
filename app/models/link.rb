class Link < ApplicationRecord
  LINK_LIMIT = 5

  belongs_to :user
  has_many :clicks
end
