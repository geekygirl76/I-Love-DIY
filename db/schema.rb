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

ActiveRecord::Schema.define(version: 20140711152129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockrecords", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", force: true do |t|
    t.integer  "sub_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collects", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "parent_comment_id"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id",                   null: false
    t.integer  "receiver_id",                 null: false
    t.string   "title",                       null: false
    t.string   "body",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false
    t.string   "draft"
    t.boolean  "trashed"
    t.boolean  "blocked"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "sub_id",             null: false
    t.integer  "user_id",            null: false
    t.string   "title",              null: false
    t.text     "body",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "channel_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "score"
  end

  create_table "sub_posts", force: true do |t|
    t.integer  "sub_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subs", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "subs", ["title"], name: "index_subs_on_title", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "password_digest",                    null: false
    t.string   "session_token",                      null: false
    t.string   "email",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",          default: false
    t.string   "activation_token"
    t.string   "confirm_password"
    t.integer  "age"
    t.string   "gender"
    t.integer  "zip"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "voterecords", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
