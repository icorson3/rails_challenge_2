class Book < ApplicationRecord
   has_many :reviews
   has_many :users, through: :reviews

   def average_rating
   end

end
