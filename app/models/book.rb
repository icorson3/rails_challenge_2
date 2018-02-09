class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def highest_rating
    self.reviews.order('rating DESC').first.rating
  end

  def lowest_rating
    self.reviews.order('rating').first.rating
  end
end
