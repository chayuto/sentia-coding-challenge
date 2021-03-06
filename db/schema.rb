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

ActiveRecord::Schema.define(version: 20210802120911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade, comment: "affiliations table" do |t|
    t.string "name", comment: "affiliation name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliations_people", id: false, force: :cascade do |t|
    t.bigint "affiliation_id", null: false
    t.bigint "person_id", null: false
    t.index ["affiliation_id"], name: "index_affiliations_people_on_affiliation_id"
    t.index ["person_id"], name: "index_affiliations_people_on_person_id"
  end

  create_table "locations", force: :cascade, comment: "starwars location table" do |t|
    t.string "name", comment: "location name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_people", id: false, force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "person_id", null: false
    t.index ["location_id"], name: "index_locations_people_on_location_id"
    t.index ["person_id"], name: "index_locations_people_on_person_id"
  end

  create_table "people", force: :cascade, comment: "Starwars universe People table" do |t|
    t.string "first_name", comment: "person first name"
    t.string "last_name", comment: "person last name (optional)"
    t.string "species", comment: "person Species"
    t.string "gender", comment: "gender [m/f/others]"
    t.string "weapon", comment: "Weapon"
    t.string "vehicle", comment: "Vehicle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
