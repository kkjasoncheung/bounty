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

ActiveRecord::Schema.define(version: 20170122122947) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "body",       limit: 65535
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["forum_id"], name: "index_comments_on_forum_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "forums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "location"
    t.integer  "radius"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "to_id"
    t.index ["user_id"], name: "index_forums_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "body",       limit: 65535
    t.integer  "to_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "read"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "product_name"
    t.string   "store_name"
    t.text     "description",       limit: 65535
    t.float    "est_price",         limit: 24
    t.string   "delivery_location"
    t.integer  "to_id"
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "read"
    t.index ["forum_id"], name: "index_requests_on_forum_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "yob"
    t.integer  "year_study"
    t.string   "residence"
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "email"
    t.string   "gender"
    t.integer  "forum_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "school"
    t.integer  "school_id"
    t.string   "dp_file_name"
    t.string   "dp_content_type"
    t.integer  "dp_file_size"
    t.datetime "dp_updated_at"
    t.string   "phone"
    t.index ["forum_id"], name: "index_users_on_forum_id", using: :btree
  end

end
