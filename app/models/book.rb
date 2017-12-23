class Book < ApplicationRecord

  has_many :reviews
      has_many :users, through: :reviews

def average
  reviews.average(:rating)
end

end
