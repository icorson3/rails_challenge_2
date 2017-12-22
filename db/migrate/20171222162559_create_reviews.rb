class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :body
      t.references :user, foreign_key: true
    end
  end
end
