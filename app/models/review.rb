class Review < ApplicationRecord
  belongs_to :user

  has_many :reviewings
  has_many :reviews, through: :reviewings
end
