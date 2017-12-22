class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews


  def average_rating
    Book.reviews.average(rating)
  end
end
