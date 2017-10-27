class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def max_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end

  def best_review
    reviews.order("rating DESC").first
  end

  def worst_review
    reviews.order(:rating).first
  end

end
