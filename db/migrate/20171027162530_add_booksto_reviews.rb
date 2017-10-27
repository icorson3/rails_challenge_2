class AddBookstoReviews < ActiveRecord::Migration[5.1]
  def change
     add_reference :reviews, :book
  end
end
