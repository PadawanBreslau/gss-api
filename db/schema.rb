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

ActiveRecord::Schema.define(version: 2020_10_21_122902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gps_locations", force: :cascade do |t|
    t.float "lat", null: false
    t.float "lon", null: false
    t.bigint "mezoregion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mezoregion_id"], name: "index_gps_locations_on_mezoregion_id"
  end

  create_table "macroregions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mezoregions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "macroregion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["macroregion_id"], name: "index_mezoregions_on_macroregion_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "start", null: false
    t.string "finish", null: false
    t.text "description"
    t.integer "order", null: false
    t.integer "variation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "gps_locations", "mezoregions"
  add_foreign_key "mezoregions", "macroregions"
end
