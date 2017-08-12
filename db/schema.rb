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

ActiveRecord::Schema.define(version: 20170811204509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "slug"
    t.string   "owner"
    t.string   "post_title"
    t.string   "post_subtitle"
    t.string   "post_body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "blog_name"
    t.string   "blog_facebook"
    t.string   "blog_twitter"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "reset"
    t.string   "activation_code"
    t.string   "activated"
    t.string   "level"
    t.string   "enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
