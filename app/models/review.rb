class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def self.average_rating
    average("rating")
  end

  def self.highest_rating
    maximum("rating")
  end

  def self.lowest_rating
    minimum("rating")
  end

  # def self.lowest_rating_object
  #   select("*, minimum(:rating)")
  # end
end
