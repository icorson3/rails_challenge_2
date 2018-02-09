class Book < ApplicationRecord
  validates :title, presence: true

  has_many :reviews

  def self.average_ratings
    select("books.*, AVG(rating) AS avg_rating")
      .joins(:reviews)
      .group(:id)
  end
end
