class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.text :body
      t.references :book, foreign_key: true
    end
  end
end
