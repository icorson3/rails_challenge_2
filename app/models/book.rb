class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def sort_reviews_by_rating
    reviews.order(:rating)
  end

  def highest_rating
    sort_reviews_by_rating.last.rating
  end

  def lowest_rating
    sort_reviews_by_rating.first.rating
  end 
end
