class Review < ApplicationRecord
  validates_presence_of :title, :rating, :body
  belongs_to :user
  belongs_to :book

  def self.average_rating
    average(:rating)
  end
end
