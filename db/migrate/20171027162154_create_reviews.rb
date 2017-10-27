class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.user :references
      t.book :references

      t.timestamps
    end
  end
end
