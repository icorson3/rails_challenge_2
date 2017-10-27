class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
