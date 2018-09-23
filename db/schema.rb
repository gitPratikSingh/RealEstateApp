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

ActiveRecord::Schema.define(version: 2018_09_23_234616) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "house_hunters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "preferred_contact"
    t.integer "user_id"
    t.integer "users_id"
    t.index ["user_id"], name: "index_house_hunters_on_user_id"
    t.index ["users_id"], name: "index_house_hunters_on_users_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.integer "square_footage"
    t.integer "year_built"
    t.string "style"
    t.integer "list_price"
    t.integer "num_of_floors"
    t.boolean "basement"
    t.string "current_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "real_estate_companies_id"
    t.integer "realtor_id"
    t.index ["real_estate_companies_id"], name: "index_houses_on_real_estate_companies_id"
    t.index ["realtor_id"], name: "index_houses_on_realtor_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_id"
    t.integer "house_hunter_id"
    t.index ["house_hunter_id"], name: "index_inquiries_on_house_hunter_id"
    t.index ["house_id"], name: "index_inquiries_on_house_id"
  end

  create_table "real_estate_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.integer "size"
    t.integer "founded"
    t.integer "revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "synopsis"
  end

  create_table "realtors", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "full_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "real_estate_companies_id"
    t.index ["real_estate_companies_id"], name: "index_realtors_on_real_estate_companies_id"
    t.index ["user_id"], name: "index_realtors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "user_type"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
