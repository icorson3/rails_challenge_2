class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.sum do |review|
      review.rating
    end.to_f / reviews.count
  end
end
