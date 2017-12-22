class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    reviews.sum(:rating).to_f / reviews.count
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end

  def highest_rated_review
    Review.find_by(rating: highest_rating)
  end

  def lowest_rated_review
    Review.find_by(rating: lowest_rating)
  end

end
