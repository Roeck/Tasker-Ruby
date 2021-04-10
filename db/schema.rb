ActiveRecord::Schema.define(version: 2021_04_10_215549) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
  end
end
