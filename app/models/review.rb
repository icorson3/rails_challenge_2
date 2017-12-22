class Review < ApplicationRecord
  validates_presence_of :body
  validates_presence_of :rating
  belongs_to :user
  belongs_to :book
end
