# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150410001143) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "car_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_type_id"
    t.integer  "car_status_id"
    t.integer  "user_id"
  end

  add_index "cars", ["car_status_id"], name: "index_cars_on_car_status_id", using: :btree
  add_index "cars", ["car_type_id"], name: "index_cars_on_car_type_id", using: :btree
  add_index "cars", ["user_id"], name: "index_cars_on_user_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_addresses", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "ref"
    t.integer  "district_id"
    t.integer  "zone_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_addresses", ["district_id"], name: "index_favorite_addresses_on_district_id", using: :btree
  add_index "favorite_addresses", ["user_id"], name: "index_favorite_addresses_on_user_id", using: :btree
  add_index "favorite_addresses", ["zone_id"], name: "index_favorite_addresses_on_zone_id", using: :btree

  create_table "payment_methods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zone_o_id"
    t.integer  "zone_d_id"
  end

  add_index "rates", ["zone_d_id"], name: "index_rates_on_zone_d_id", using: :btree
  add_index "rates", ["zone_o_id"], name: "index_rates_on_zone_o_id", using: :btree

  create_table "reservation_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservation_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "rate_id"
    t.integer  "district_o_id"
    t.integer  "zone_o_id"
    t.string   "address_o"
    t.string   "ref_o"
    t.integer  "district_d_id"
    t.string   "address_d"
    t.string   "ref_d"
    t.integer  "price"
    t.integer  "passengers_qty"
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_method_id"
    t.integer  "zone_d_id"
    t.integer  "reservation_status_id"
    t.string   "code"
    t.integer  "reservation_type_id"
    t.integer  "car_type_id"
    t.text     "feedback"
    t.datetime "date_time"
  end

  add_index "reservations", ["car_id"], name: "index_reservations_on_car_id", using: :btree
  add_index "reservations", ["car_type_id"], name: "index_reservations_on_car_type_id", using: :btree
  add_index "reservations", ["payment_method_id"], name: "index_reservations_on_payment_method_id", using: :btree
  add_index "reservations", ["reservation_status_id"], name: "index_reservations_on_reservation_status_id", using: :btree
  add_index "reservations", ["reservation_type_id"], name: "index_reservations_on_reservation_type_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_type_id"
    t.string   "name"
    t.string   "lastname"
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "dni"
    t.date     "birthday"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  create_table "zones", force: true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zones", ["district_id"], name: "index_zones_on_district_id", using: :btree

end
