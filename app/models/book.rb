class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average_rating
  end

  def highest_rating
    reviews.highest_rating
  end

  def lowest_rating
    reviews.lowest_rating
  end
end
