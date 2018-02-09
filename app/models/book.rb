class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_i
  end

  def top_rating
    reviews.maximum(:rating).to_i
  end
end
