class User < ApplicationRecord
  validates :name, presence: true, uniqueness:true
  has_many :reviews
  has_many :books, through: :reviews
end
