class Review < ApplicationRecord
  validates_presence_of :body, :rating
  belongs_to :user
  belongs_to :book

  def self.average_rating
    average(:rating)
  end

  def self.by_rating
    order(:rating)
  end
end
