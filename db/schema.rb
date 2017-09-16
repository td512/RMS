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

ActiveRecord::Schema.define(version: 20170907012903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "owner"
    t.string   "awaiting_moderation"
    t.string   "post_id"
    t.string   "deleted"
    t.string   "content"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "slug"
    t.string   "owner"
    t.string   "post_title"
    t.string   "post_subtitle"
    t.string   "post_body"
    t.string   "post_category"
    t.string   "post_shares"
    t.string   "post_views"
    t.string   "post_comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "blog_name"
    t.string   "blog_tagline"
    t.string   "blog_about"
    t.string   "blog_facebook"
    t.string   "blog_twitter"
    t.string   "blog_email"
    t.string   "blog_appid"
    t.string   "blog_logo"
    t.string   "blog_css_bg"
    t.string   "blog_css_tc"
    t.string   "blog_css_post"
    t.string   "blog_css_button"
    t.string   "blog_css_header"
    t.string   "blog_css_highlight"
    t.string   "dash_css_bg"
    t.string   "dash_css_tc"
    t.string   "dash_css_mtc"
    t.string   "dash_css_highlight"
    t.string   "recaptcha_public"
    t.string   "recaptcha_private"
    t.string   "errors_override"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.string   "facebook"
    t.string   "twitter"
    t.string   "oneline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
