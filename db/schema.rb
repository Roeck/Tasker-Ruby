ActiveRecord::Schema.define(version: 2021_04_12_203829) do

  create_table "tasks", force: :cascade do |t|
    t.string "chore"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
  end

end
