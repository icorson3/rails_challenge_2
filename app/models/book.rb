class Book < ApplicationRecord
    has_many :reviews
  
    def average_rating
        self.reviews.average(:rating)
    end

    def highest_rating
        self.reviews.maximum(:rating)
    end

    def highest_rating_review
        byebug
        self.reviews.maximum(:rating).review
    end

    def lowest_rating
        self.reviews.minimum(:rating)
    end
end
