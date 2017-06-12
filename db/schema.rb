# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170611232255) do

  create_table "bookmarked_deputies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deputy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarked_senators", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "senator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_expense_deputies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "body"
    t.integer  "red_flag_expense_deputy_id"
    t.integer  "deputy_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments_expense_senators", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "body"
    t.integer  "red_flag_expense_senator_id"
    t.integer  "senator_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "deputies", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "sex"
    t.string   "state"
    t.string   "telephone"
    t.string   "email"
    t.string   "picture"
    t.string   "expenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "red_flag_expense_deputies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deputy_id"
    t.string   "expense_description"
    t.string   "expense_detail"
    t.float    "expense_amount"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "red_flag_expense_senators", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "senator_id"
    t.string   "expense_description"
    t.string   "expense_detail"
    t.float    "expense_amount"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "senators", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "sex"
    t.string   "state"
    t.string   "telephone"
    t.string   "email"
    t.string   "picture"
    t.string   "expenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
