class Review < ApplicationRecord
  belongs_to :user
  blongs_to :book
end