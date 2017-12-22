class Book < ApplicationRecord
  has_many :reviews

  def avg_rating
    reviews.average("rating").round(2)
  end
  
end
