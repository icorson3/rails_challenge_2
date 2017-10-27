class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.average_book_rating
    average(:rating)
  end

  def self.max_min_book_rating(asc_or_desc)
    order("rating #{asc_or_desc}")
    .first
    .rating
  end
end
