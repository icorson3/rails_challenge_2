class CreateBooksUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :books, :users
  end

end
