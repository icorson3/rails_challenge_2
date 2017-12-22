class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def author
    user.name
  end
end
