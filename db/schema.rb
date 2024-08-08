# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_08_08_135312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id", "post_id"], name: "index_favorites_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "lives", force: :cascade do |t|
    t.string "title", null: false
    t.string "place"
    t.date "date"
    t.time "open_time"
    t.time "start_time"
    t.datetime "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_lives_on_post_id"
    t.index ["user_id"], name: "index_lives_on_user_id"
  end

  create_table "packing_items", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_checked"
    t.bigint "live_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["live_id"], name: "index_packing_items_on_live_id"
    t.index ["user_id"], name: "index_packing_items_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "comment"
    t.boolean "is_anonymous"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "live_id"
    t.index ["live_id"], name: "index_posts_on_live_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "lives", "posts"
  add_foreign_key "lives", "users"
  add_foreign_key "packing_items", "lives", column: "live_id"
  add_foreign_key "packing_items", "users"
  add_foreign_key "posts", "lives", column: "live_id"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
end
