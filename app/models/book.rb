class Book < ApplicationRecord
  has_many :reviews

	def average
		self.reviews.average(:rating).round(2)
	end 

	def max
		self.reviews.maximum(:rating)
	end 

	def max_review
		max_rating = self.reviews.maximum(:rating)
		self.reviews.find_by(rating: max_rating)
	end 
	
	def min
		self.reviews.minimum(:rating)
	end

	def min_review
		min_rating = self.reviews.minimum(:rating)
		self.reviews.find_by(rating: min_rating)
	end 
end
