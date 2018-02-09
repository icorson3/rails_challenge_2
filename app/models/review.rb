class Review < ApplicationRecord
  validates_presence_of :body, :rating
  belongs_to :user
  belongs_to :book
end
