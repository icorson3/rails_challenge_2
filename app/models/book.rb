class Book < ApplicationRecord

  has_many :reviews

  def avg_rating
    reviews.average_rating
  end

  def max_rating
    reviews.max_rating
  end

  def min_rating
    reviews.min_rating
  end

  def review_with_max_rating
    reviews.find_by(rating: max_rating)
  end

  def review_with_min_rating
    reviews.find_by(rating: min_rating)
  end
end
