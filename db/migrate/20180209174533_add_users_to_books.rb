class AddUsersToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :User, foreign_key: true
  end
end
