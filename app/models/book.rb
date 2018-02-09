class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def highest_review
    self.reviews.order('rating DESC').first
  end

  def lowest_review
    self.reviews.order('rating').first
  end
end
