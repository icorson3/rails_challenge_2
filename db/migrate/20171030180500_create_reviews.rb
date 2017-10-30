class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string   :body
      t.string       :author
      t.string       :rating

      t.timestamps
    end
  end
end
