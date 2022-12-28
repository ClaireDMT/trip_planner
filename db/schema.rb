# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_21_211022) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "user_id"
    t.bigint "transit_id"
    t.bigint "lodging_id"
    t.bigint "rental_id"
    t.bigint "place_id"
    t.bigint "category_id", null: false
    t.datetime "date"
    t.integer "split"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["lodging_id"], name: "index_expenses_on_lodging_id"
    t.index ["place_id"], name: "index_expenses_on_place_id"
    t.index ["rental_id"], name: "index_expenses_on_rental_id"
    t.index ["transit_id"], name: "index_expenses_on_transit_id"
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.boolean "paid"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.integer "price_per_night_cents", default: 0, null: false
    t.index ["trip_id"], name: "index_lodgings_on_trip_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "date"
    t.float "longitude"
    t.float "latitude"
    t.boolean "paid", default: false
    t.bigint "trip_id", null: false
    t.integer "status"
    t.string "comment"
    t.bigint "attraction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["attraction_id"], name: "index_places_on_attraction_id"
    t.index ["trip_id"], name: "index_places_on_trip_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "rental_type"
    t.boolean "paid", default: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "trip_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["trip_id"], name: "index_rentals_on_trip_id"
  end

  create_table "transits", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "transport_type"
    t.string "from"
    t.string "to"
    t.boolean "paid", default: false
    t.bigint "trip_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["trip_id"], name: "index_transits_on_trip_id"
  end

  create_table "trip_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_trip_users_on_trip_id"
    t.index ["user_id"], name: "index_trip_users_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "lodgings"
  add_foreign_key "expenses", "places"
  add_foreign_key "expenses", "rentals"
  add_foreign_key "expenses", "transits"
  add_foreign_key "expenses", "trips"
  add_foreign_key "expenses", "users"
  add_foreign_key "lodgings", "trips"
  add_foreign_key "places", "attractions"
  add_foreign_key "places", "trips"
  add_foreign_key "rentals", "trips"
  add_foreign_key "transits", "trips"
  add_foreign_key "trip_users", "trips"
  add_foreign_key "trip_users", "users"
end
