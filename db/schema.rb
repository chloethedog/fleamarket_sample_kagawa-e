# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_03_022244) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "prefecture_id"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "seller", null: false
    t.integer "price", null: false
    t.integer "purchase", null: false
    t.integer "purchase_id"
    t.text "explanation", null: false
    t.integer "category_id", null: false
    t.integer "state_id", null: false
    t.string "brand"
    t.integer "delivery_fee_id", null: false
    t.integer "delivery_are_id", null: false
    t.integer "delivery_method_id", null: false
    t.integer "shipment_date_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand"], name: "index_items_on_brand"
    t.index ["name"], name: "index_items_on_name"
  end

end
