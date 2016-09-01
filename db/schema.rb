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

ActiveRecord::Schema.define(version: 20160901145134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "formatted_address"
  end

  create_table "condos", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "condo_name"
    t.integer  "price"
    t.integer  "sq_ft"
    t.integer  "beds"
    t.float    "baths"
    t.boolean  "parking"
    t.integer  "hoa"
    t.integer  "zillow_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "building_id"
  end

  create_table "condos_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "condo_id", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "zipcode"
    t.string   "city"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "min_feet"
    t.integer  "max_feet"
    t.integer  "min_bed"
    t.integer  "max_bed"
    t.float    "min_bath"
    t.float    "max_bath"
    t.boolean  "parking"
    t.integer  "min_hoa"
    t.integer  "max_hoa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
