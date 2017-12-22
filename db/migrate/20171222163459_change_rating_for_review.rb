class ChangeRatingForReview < ActiveRecord::Migration[5.1]
def change
  change_column :reviews, :rating, 'integer USING CAST(column_name AS integer)'
change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'

end
end
