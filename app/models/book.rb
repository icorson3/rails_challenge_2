class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :reviews
  has_many :users, through: :reviews
end
