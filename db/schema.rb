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

ActiveRecord::Schema.define(version: 2021_12_02_213139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "nearest_city"
    t.string "state"
    t.boolean "has_free_camping"
    t.integer "cost_for_paid_camping"
    t.string "rock_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "travel_advisory"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbs", force: :cascade do |t|
    t.string "name"
    t.string "sport_or_trad"
    t.string "yds_difficulty"
    t.integer "number_of_pitches"
    t.integer "number_of_draws"
    t.boolean "dangerous_falls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_climbs_on_area_id"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name"
    t.boolean "vacancies"
    t.integer "max_occupancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_hostels_on_city_id"
  end

  add_foreign_key "climbs", "areas"
  add_foreign_key "hostels", "cities"
end
