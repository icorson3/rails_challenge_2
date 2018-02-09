class AddRatingToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :rating, foreign_key: true
  end
end
