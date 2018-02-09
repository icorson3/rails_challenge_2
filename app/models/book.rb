class Book < ApplicationRecord
  has_many :reviews

  def average_rating
  end 
end
