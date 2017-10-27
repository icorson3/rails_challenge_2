class AddUserToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :review, :user, foreign_key: true
  end
end
