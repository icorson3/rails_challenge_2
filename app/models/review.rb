class Review < ApplicationRecord
  validates_presence_of :title, :rating, :body
  belongs_to :user
  belongs_to :book
end
