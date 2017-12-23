class Book < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  def average
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def highest_rating_review
    reviews.find_by(:rating=>4)
  end

  def lowest_rating_review
    reviews.find_by(:rating=>1)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end


end
