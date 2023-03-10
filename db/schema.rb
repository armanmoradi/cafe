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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_173914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cafe_restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.integer "employees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cafe_restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_type"
    t.boolean "active"
    t.index ["cafe_restaurant_id"], name: "index_user_roles_on_cafe_restaurant_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.date "age"
  end

  add_foreign_key "user_roles", "cafe_restaurants"
  add_foreign_key "user_roles", "users"
end
