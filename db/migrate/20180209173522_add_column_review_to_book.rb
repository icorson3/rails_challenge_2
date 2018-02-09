class AddColumnReviewToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :review, :string
  end
end
