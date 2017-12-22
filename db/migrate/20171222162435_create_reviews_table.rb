class CreateReviewsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :rating
    end
  end
end
