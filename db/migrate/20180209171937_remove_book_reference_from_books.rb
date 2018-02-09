class RemoveBookReferenceFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_reference :books, :book, index:true, foreign_key: true
  end
end
