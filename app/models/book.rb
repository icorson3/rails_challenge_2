class Book < ApplicationRecord
  has_many :reviews


  def average_rating
    reviews.average(:rating).to_i
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end

  def highest_rated_review
    reviews.where(rating: highest_rating).first
  end

  def lowest_rated_review
    reviews.where(rating: lowest_rating).first
  end
end
