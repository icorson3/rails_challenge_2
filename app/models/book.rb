class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.select("avg(rating)") 
  end
end
