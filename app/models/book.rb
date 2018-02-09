class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews

  def average_rating
    reviews.average_rating
  end

  def highest_rating
    reviews.by_rating.last.rating
  end

  def lowest_rating
    reviews.by_rating.first.rating
  end
end
