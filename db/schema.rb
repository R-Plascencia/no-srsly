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

ActiveRecord::Schema.define(version: 20180218012354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.bigint "source_id"
    t.string "title", null: false
    t.text "summary", default: "Click for details"
    t.string "top_img"
    t.string "url", null: false
    t.string "keywords", default: ""
    t.datetime "pub_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_articles_on_source_id"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "website", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "sources"
end
