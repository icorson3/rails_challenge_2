class AddRatingsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :book, foreign_key: true
  end
end
