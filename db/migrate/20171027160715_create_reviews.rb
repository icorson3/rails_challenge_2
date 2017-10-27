class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :books
      t.references :users
      t.text :body

      t.timestamp
    end
  end
end
