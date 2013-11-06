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

ActiveRecord::Schema.define(version: 20131105163356) do

  create_table "attractions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cities_id"
    t.integer  "categories_id"
  end

  add_index "attractions", ["categories_id"], name: "index_attractions_on_categories_id"
  add_index "attractions", ["cities_id"], name: "index_attractions_on_cities_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cities_id"
  end

  add_index "categories", ["cities_id"], name: "index_categories_on_cities_id"

  create_table "cities", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
