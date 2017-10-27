class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :book
      t.references :user
      t.text :body

      t.timestamp
    end
  end
end
