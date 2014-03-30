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

ActiveRecord::Schema.define(version: 20140326190137) do

  create_table "item_lines", force: true do |t|
    t.integer  "quantity"
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_lines", ["order_id"], name: "index_item_lines_on_order_id", using: :btree
  add_index "item_lines", ["product_id"], name: "index_item_lines_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "order_status"
    t.string   "payment"
    t.text     "address"
    t.string   "city"
    t.string   "buyer_name"
    t.string   "buyer_lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "manufacturer"
    t.integer  "units"
    t.datetime "registered_at"
    t.string   "category"
    t.decimal  "price",         precision: 8, scale: 2
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "lastname"
  end

end
