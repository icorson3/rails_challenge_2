class AddBodyToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :body, :text
  end
end
