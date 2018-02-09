class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews

  def average_rating
    reviews.average_rating
  end
end
