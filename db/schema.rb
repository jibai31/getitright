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

ActiveRecord::Schema.define(version: 20140725140514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer "user_id"
    t.string  "provider"
    t.string  "uid"
    t.string  "token"
    t.string  "token_secret"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "check_list_definitions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "check_list_definitions", ["name"], name: "index_check_list_definitions_on_name", using: :btree
  add_index "check_list_definitions", ["user_id"], name: "index_check_list_definitions_on_user_id", using: :btree

  create_table "check_lists", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "check_list_definition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "check_lists", ["check_list_definition_id"], name: "index_check_lists_on_check_list_definition_id", using: :btree
  add_index "check_lists", ["name"], name: "index_check_lists_on_name", using: :btree
  add_index "check_lists", ["status"], name: "index_check_lists_on_status", using: :btree
  add_index "check_lists", ["user_id"], name: "index_check_lists_on_user_id", using: :btree

  create_table "task_definitions", force: true do |t|
    t.integer  "check_list_definition_id"
    t.integer  "step"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_definitions", ["check_list_definition_id"], name: "index_task_definitions_on_check_list_definition_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "step"
    t.boolean  "done"
    t.integer  "task_definition_id"
    t.integer  "check_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text"
  end

  add_index "tasks", ["check_list_id"], name: "index_tasks_on_check_list_id", using: :btree
  add_index "tasks", ["task_definition_id"], name: "index_tasks_on_task_definition_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
