class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
    end
  end
end
