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

ActiveRecord::Schema[7.1].define(version: 2024_03_13_213559) do
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

  create_table "available_times", force: :cascade do |t|
    t.boolean "free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weekday"
    t.integer "start"
    t.integer "finish"
    t.string "timeable_type", null: false
    t.bigint "timeable_id", null: false
    t.index ["timeable_type", "timeable_id"], name: "index_available_times_on_timeable"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "professional_id", null: false
    t.bigint "customer_id", null: false
    t.integer "hour"
    t.integer "duration"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_schedules_on_customer_id"
    t.index ["professional_id"], name: "index_schedules_on_professional_id"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "service_professionals", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professional_id"], name: "index_service_professionals_on_professional_id"
    t.index ["service_id"], name: "index_service_professionals_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "duration"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "schedules", "customers"
  add_foreign_key "schedules", "professionals"
  add_foreign_key "schedules", "services"
  add_foreign_key "service_professionals", "professionals"
  add_foreign_key "service_professionals", "services"
end
