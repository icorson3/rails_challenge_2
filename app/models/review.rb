class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def self.average_rating(id)
    where(book_id: id).average(:rating)
  end

  def self.highest_rating(id)
    where(book_id: id).maximum(:rating)
  end

  def self.lowest_rating(id)
    where(book_id: id).minimum(:rating)
  end

  def self.highest_rating_info(id)
    where(book_id: id).order("rating DESC").first
  end

  def self.lowest_rating_info(id)
    where(book_id: id).order("rating ASC").first
  end
end
