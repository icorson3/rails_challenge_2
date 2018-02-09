class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.references :book, foreign_key: true

      t.timestamps null: false
    end
  end
end
