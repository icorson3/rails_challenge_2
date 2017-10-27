ActiveRecord::Schema.define(version: 20171024183246) do
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end
end
