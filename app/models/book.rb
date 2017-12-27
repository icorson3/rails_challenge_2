class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    byebug
    avg(reviews.rating)
  end

  def maximum_rating
    maximum(reviews.rating)
  end

  def minimum_rating
    minimum(reviews.rating)
  end
end
