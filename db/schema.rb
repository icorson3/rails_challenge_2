ActiveRecord::Schema.define(version: 20171027161818) do
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.text   "body"
    t.index  ["book_id"], name: "index_reviews_on_book_id"
    t.index  ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
