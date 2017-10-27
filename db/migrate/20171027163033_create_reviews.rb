class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body
      t.timestamps
      t.references :user, index: true
      t.references  :book, index: true
    end
  end
end
