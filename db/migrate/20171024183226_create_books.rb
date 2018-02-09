class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.rating :integer
      t.string :title
    end
  end
end
