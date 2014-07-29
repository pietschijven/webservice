# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140729200531) do

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balances", force: true do |t|
    t.date     "time_period"
    t.text     "balance_check"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.float    "cost"
    t.integer  "paid_for_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "time_period"
  end

  add_index "expenses", ["paid_for_user_id"], name: "index_expenses_on_paid_for_user_id"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "users", force: true do |t|
    t.string "name"
    t.float  "salary"
  end

end
