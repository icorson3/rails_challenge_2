class AddBooksToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :books, foreign_key: true
  end
end
