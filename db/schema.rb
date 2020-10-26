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

ActiveRecord::Schema.define(version: 2020_10_24_200209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "gps_locations", force: :cascade do |t|
    t.float "lat", null: false
    t.float "lon", null: false
    t.bigint "mezoregion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mezoregion_id"], name: "index_gps_locations_on_mezoregion_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imagable_type", null: false
    t.bigint "imagable_id", null: false
    t.jsonb "information"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imagable_type", "imagable_id"], name: "index_images_on_imagable_type_and_imagable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "attraction", default: false
    t.bigint "subsection_id", null: false
    t.bigint "gps_location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gps_location_id"], name: "index_locations_on_gps_location_id"
    t.index ["subsection_id"], name: "index_locations_on_subsection_id"
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

  create_table "subsections", force: :cascade do |t|
    t.text "description"
    t.string "start"
    t.string "finish"
    t.integer "track_color"
    t.jsonb "information"
    t.integer "section_order", null: false
    t.bigint "section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_subsections_on_section_id"
  end

  create_table "trivia", force: :cascade do |t|
    t.text "content"
    t.string "triviable_type", null: false
    t.bigint "triviable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["triviable_type", "triviable_id"], name: "index_trivia_on_triviable_type_and_triviable_id"
  end

  create_table "utilities", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "information"
    t.bigint "gps_location_id", null: false
    t.bigint "location_id", null: false
    t.integer "utility_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gps_location_id"], name: "index_utilities_on_gps_location_id"
    t.index ["location_id"], name: "index_utilities_on_location_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "gps_locations", "mezoregions"
  add_foreign_key "locations", "gps_locations"
  add_foreign_key "locations", "subsections"
  add_foreign_key "mezoregions", "macroregions"
  add_foreign_key "subsections", "sections"
  add_foreign_key "utilities", "gps_locations"
  add_foreign_key "utilities", "locations"
end
