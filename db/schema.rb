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

ActiveRecord::Schema[7.1].define(version: 2024_02_06_091817) do
  create_table "children", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.string "name", null: false
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "counts", force: :cascade do |t|
    t.integer "promise_id", null: false
    t.boolean "completed", default: false
    t.date "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_counts_on_promise_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  create_table "paydays", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "child_id", null: false
    t.integer "date"
    t.integer "week"
    t.boolean "end_month"
    t.integer "action_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_paydays_on_child_id"
    t.index ["parent_id"], name: "index_paydays_on_parent_id"
  end

  create_table "promises", force: :cascade do |t|
    t.integer "child_id", null: false
    t.string "description", null: false
    t.integer "day_of_week"
    t.datetime "start_day"
    t.boolean "monthly_flag"
    t.integer "frequency"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_promises_on_child_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.integer "payday_id", null: false
    t.integer "child_id", null: false
    t.string "body", null: false
    t.integer "pieces"
    t.integer "pt_range"
    t.string "pt_addition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_rewards_on_child_id"
    t.index ["payday_id"], name: "index_rewards_on_payday_id"
  end

  add_foreign_key "children", "parents"
  add_foreign_key "counts", "promises"
  add_foreign_key "paydays", "children"
  add_foreign_key "paydays", "parents"
  add_foreign_key "promises", "children"
  add_foreign_key "rewards", "children"
  add_foreign_key "rewards", "paydays"
end
