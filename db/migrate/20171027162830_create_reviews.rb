class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|

      t.text :body
      t.integer :rating

      t.references :book,
        index: true,
        null: false
      t.foreign_key :books,
        on_delete: :cascade

      t.references :user,
        index: true,
        null: false
      t.foreign_key :users,
        on_delete: :cascade

    end
  end
end
