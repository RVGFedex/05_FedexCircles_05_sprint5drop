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

ActiveRecord::Schema.define(version: 20150507190800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circles", force: :cascade do |t|
    t.string   "name"
    t.string   "group_code"
    t.integer  "points"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "params", force: :cascade do |t|
    t.string   "grouping"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points_logs", force: :cascade do |t|
    t.integer  "circle_id"
    t.integer  "policy_id"
    t.integer  "reward_takeup_id"
    t.string   "event_type"
    t.integer  "debit"
    t.integer  "credit"
    t.integer  "balance"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "points_logs", ["circle_id"], name: "index_points_logs_on_circle_id", using: :btree
  add_index "points_logs", ["policy_id"], name: "index_points_logs_on_policy_id", using: :btree
  add_index "points_logs", ["reward_takeup_id"], name: "index_points_logs_on_reward_takeup_id", using: :btree

  create_table "policies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "policy_number"
    t.float    "premium"
    t.string   "frequency"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "policies", ["product_id"], name: "index_policies_on_product_id", using: :btree
  add_index "policies", ["user_id"], name: "index_policies_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "spweight"
    t.float    "rpweight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reward_takeups", force: :cascade do |t|
    t.integer  "reward_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reward_takeups", ["reward_id"], name: "index_reward_takeups_on_reward_id", using: :btree
  add_index "reward_takeups", ["user_id"], name: "index_reward_takeups_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "offer_type"
    t.integer  "min_circle_size"
    t.integer  "min_circle_points"
    t.string   "title"
    t.integer  "points_cost"
    t.float    "discount"
    t.string   "desc1"
    t.string   "desc2"
    t.string   "artwork_filename"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "rewards", ["product_id"], name: "index_rewards_on_product_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.integer  "circle_id"
    t.string   "address"
    t.string   "phone_number"
    t.date     "dob"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["circle_id"], name: "index_users_on_circle_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "points_logs", "circles"
  add_foreign_key "points_logs", "policies"
  add_foreign_key "points_logs", "reward_takeups"
  add_foreign_key "policies", "products"
  add_foreign_key "policies", "users"
  add_foreign_key "reward_takeups", "rewards"
  add_foreign_key "reward_takeups", "users"
  add_foreign_key "rewards", "products"
  add_foreign_key "users", "circles"
  add_foreign_key "users", "roles"
end
