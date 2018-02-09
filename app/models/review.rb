class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def self.average_rating
    average(:rating)
  end

  def self.by_rating
    order(:rating)
  end
end
