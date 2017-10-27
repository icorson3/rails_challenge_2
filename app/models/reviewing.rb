class Reviewing < ApplicationRecord
  belongs_to :book
  belongs_to :reviews
end
