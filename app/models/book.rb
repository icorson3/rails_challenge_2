class Book < ApplicationRecord

  has_many :reviews

  def avg_rating
    reviews.average_rating
  end

end
