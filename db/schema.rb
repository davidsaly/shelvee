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

ActiveRecord::Schema.define(version: 20151114111107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
  end

  create_table "belongings", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "belongings", ["album_id"], name: "index_belongings_on_album_id", using: :btree
  add_index "belongings", ["photo_id"], name: "index_belongings_on_photo_id", using: :btree

  create_table "contributions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contributions", ["photo_id"], name: "index_contributions_on_photo_id", using: :btree
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id", using: :btree

  create_table "cooperations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cooperations", ["album_id"], name: "index_cooperations_on_album_id", using: :btree
  add_index "cooperations", ["user_id"], name: "index_cooperations_on_user_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "recipient_email"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.integer  "album_id"
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "accepted"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "album_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  add_index "selections", ["album_id"], name: "index_selections_on_album_id", using: :btree

  create_table "shelvings", force: :cascade do |t|
    t.integer  "photo_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "selection_id"
  end

  add_index "shelvings", ["photo_id"], name: "index_shelvings_on_photo_id", using: :btree
  add_index "shelvings", ["selection_id"], name: "index_shelvings_on_selection_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "albums", "users", column: "owner_id"
  add_foreign_key "belongings", "albums"
  add_foreign_key "belongings", "photos"
  add_foreign_key "contributions", "photos"
  add_foreign_key "contributions", "users"
  add_foreign_key "cooperations", "albums"
  add_foreign_key "cooperations", "users"
  add_foreign_key "photos", "users", column: "owner_id"
  add_foreign_key "selections", "albums"
  add_foreign_key "selections", "users", column: "owner_id"
  add_foreign_key "shelvings", "photos"
  add_foreign_key "shelvings", "selections"
end
