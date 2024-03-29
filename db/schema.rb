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

ActiveRecord::Schema.define(version: 2022_08_04_194747) do

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

  create_table "components", id: false, force: :cascade do |t|
    t.integer "father_id", null: false
    t.integer "child_id", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.bigint "duser_id"
    t.string "devtype"
    t.string "subtype"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "log"
    t.index ["duser_id"], name: "index_devices_on_duser_id"
  end

  create_table "dusers", force: :cascade do |t|
    t.string "names"
    t.string "last_name1"
    t.string "last_name2"
    t.string "rut"
    t.string "workplace"
    t.string "email"
    t.string "mobile_phone_num"
    t.string "mobile_line_owner"
    t.string "mobile_device_owner"
    t.string "fixed_device_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "brief"
    t.integer "base_price"
    t.integer "discount"
    t.integer "sale_price"
    t.integer "stock"
    t.boolean "second_class"
    t.string "group"
    t.string "subgroup"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "brand"
    t.string "image_url"
    t.string "datasheet_url"
    t.string "hidden_msg"
    t.boolean "active"
  end

  create_table "salvoconductos", force: :cascade do |t|
    t.string "periodo"
    t.string "destino"
    t.string "nombres"
    t.string "apellido1"
    t.string "apellido2"
    t.string "tipodoc"
    t.string "paisdoc"
    t.string "numdoc"
    t.string "dv"
    t.date "fechanac"
    t.string "domicilio"
    t.string "comuna"
    t.string "mail"
    t.string "genero"
    t.string "patente"
    t.string "interregional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "area_trabajo"
  end

  create_table "substitutes", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.string "author"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_substitutes_on_product_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "company"
    t.integer "sic_number"
    t.string "title"
    t.integer "quality"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "product_id"
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_tags_on_product_id"
  end

  create_table "workers", force: :cascade do |t|
    t.integer "rut"
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.string "role"
    t.date "hired_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "devices", "dusers"
  add_foreign_key "substitutes", "products"
  add_foreign_key "tags", "products"
end
