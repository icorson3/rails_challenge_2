class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string        :review_title
      t.text          :body
      t.string        :author
      t.integer       :rating
      t.timestamps
    end
  end
end
