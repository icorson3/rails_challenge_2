class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def sort_reviews_by_rating
    reviews.order(:rating)
  end

  def highest_review
    sort_reviews_by_rating.last
  end

  def lowest_review
    sort_reviews_by_rating.first
  end
end
