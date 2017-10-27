class Book < ApplicationRecord
  has_many :reviews

  def sum_reviews
    reviews.sum(:rating)
  end

  def count_reviews
    reviews.count
  end

  def average_rating
    sum_reviews/count_reviews
  end

  def highest_rating
    reviews.max_by{ |review| review.rating }
  end

  def lowest_rating
    reviews.min_by{ |review| review.rating }
  end
end
