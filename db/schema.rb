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

ActiveRecord::Schema.define(version: 20141121135725) do

  create_table "readings", force: true do |t|
    t.integer  "station_id"
    t.integer  "bikes"
    t.integer  "slots"
    t.integer  "recorded_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "readings", ["recorded_at", "station_id"], name: "index_readings_on_recorded_at_and_station_id", unique: true

  create_table "stations", force: true do |t|
    t.string   "kind"
    t.float    "lat"
    t.float    "lng"
    t.string   "street"
    t.string   "street_number"
    t.integer  "height"
    t.string   "status"
    t.string   "nearby"
    t.integer  "slot_count"
    t.integer  "bike_count"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "percentage_of_bikes_available"
  end

  add_index "stations", ["kind", "status"], name: "index_stations_on_kind_and_status"
  add_index "stations", ["lat", "lng"], name: "index_stations_on_lat_and_lng"

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
