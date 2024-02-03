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

ActiveRecord::Schema[7.0].define(version: 2024_02_03_181715) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lives", force: :cascade do |t|
    t.string "title", null: false
    t.string "place"
    t.date "date"
    t.time "open_time"
    t.time "start_time"
    t.time "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packing_items", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_checked"
    t.bigint "live_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["live_id"], name: "index_packing_items_on_live_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "packing_items", "lives", column: "live_id"
end
