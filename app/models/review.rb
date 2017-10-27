class Review < ApplicationRecord
    validates :rating, :body, presence: true, uniqueness: true
    belongs_to :user
    belongs_to :book
end