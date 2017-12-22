class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews

  def average_rating
    ratings = reviews.map {|review| review.rating}
    ratings.inject(:+) / reviews.count
  end

  def best_review
    reviews.order("rating DESC").first
  end

  def worst_review
    reviews.order("rating ASC").first
  end
end
