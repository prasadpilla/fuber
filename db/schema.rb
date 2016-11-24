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

ActiveRecord::Schema.define(version: 20161124163255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "bookings", force: :cascade do |t|
    t.string   "booking_code"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status"
    t.float    "source",       null: false
    t.float    "destination",  null: false
    t.integer  "cab_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bookings", ["cab_id"], name: "index_bookings_on_cab_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "cab_types", force: :cascade do |t|
    t.string   "type"
    t.decimal  "base_fare",               null: false
    t.decimal  "per_mile_fare",           null: false
    t.decimal  "miles_with_in_base_fare", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cabs", force: :cascade do |t|
    t.string   "cab_model"
    t.string   "reg_no"
    t.string   "color"
    t.integer  "booking_id"
    t.integer  "cab_type_id"
    t.integer  "driver_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cabs", ["booking_id"], name: "index_cabs_on_booking_id", using: :btree
  add_index "cabs", ["cab_type_id"], name: "index_cabs_on_cab_type_id", using: :btree
  add_index "cabs", ["driver_id"], name: "index_cabs_on_driver_id", using: :btree
  add_index "cabs", ["lat"], name: "index_cabs_on_lat", using: :btree
  add_index "cabs", ["lng"], name: "index_cabs_on_lng", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "age"
    t.integer  "cab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drivers", ["cab_id"], name: "index_drivers_on_cab_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.integer  "booking_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["booking_id"], name: "index_users_on_booking_id", using: :btree

end
