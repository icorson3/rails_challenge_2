class Review < ApplicationRecord
  belongs_to :book
  has_one :user
end