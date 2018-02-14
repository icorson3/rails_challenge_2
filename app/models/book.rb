class Book < ApplicationRecord
  validates :title, presence: true

  has_many :reviews

  def average_rating
    reviews.average('rating')
  end

  def highest_rating_review
    reviews.order('rating').last
  end

  def lowest_rating_review
    reviews.order('rating').first
  end
end
