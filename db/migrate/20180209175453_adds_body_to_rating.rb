class AddsBodyToRating < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :body, :string
  end
end
