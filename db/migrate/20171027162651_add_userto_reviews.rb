class AddUsertoReviews < ActiveRecord::Migration[5.1]
  def change
     add_reference :reviews, :user
  end
end
