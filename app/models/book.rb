class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def maximum_rating
    reviews.maximum(:rating)
  end

  def minimum_rating
    reviews.minimum(:rating)
  end
end
