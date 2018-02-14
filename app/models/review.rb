class Review < ApplicationRecord
  validates :user_name, presence: true
  validates :body, presence: true
  validates :rating, presence: true

  belongs_to :book
end
