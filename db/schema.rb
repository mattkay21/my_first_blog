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

ActiveRecord::Schema.define(version: 20150507103748) do

  create_table "articles", force: true do |t|
    t.integer  "author_id"
    t.string   "title",            limit: 80
    t.string   "subhead",          limit: 140
    t.text     "content"
    t.string   "permalink"
    t.boolean  "comments_enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"
  add_index "articles", ["permalink"], name: "index_articles_on_permalink"

  create_table "authors", force: true do |t|
    t.string   "first_name",      limit: 40
    t.string   "last_name",       limit: 40
    t.string   "email"
    t.string   "pen_name",        limit: 60
    t.string   "password_digest", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "article_id"
    t.string   "reader_name", limit: 80
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

end
