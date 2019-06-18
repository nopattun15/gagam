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

ActiveRecord::Schema.define(version: 2019_06_18_093459) do

  create_table "big_purposes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.date "time_limit"
    t.boolean "done"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_big_purposes_on_user_id"
  end

  create_table "growth_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "amount"
    t.integer "count"
    t.bigint "small_purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["small_purpose_id"], name: "index_growth_reports_on_small_purpose_id"
  end

  create_table "small_purposes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.date "time_limit"
    t.boolean "done"
    t.bigint "big_purpose_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["big_purpose_id"], name: "index_small_purposes_on_big_purpose_id"
    t.index ["user_id"], name: "index_small_purposes_on_user_id"
  end

  create_table "time_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "played_time"
    t.date "played_date"
    t.bigint "small_purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["small_purpose_id"], name: "index_time_reports_on_small_purpose_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "big_purposes", "users"
  add_foreign_key "growth_reports", "small_purposes"
  add_foreign_key "small_purposes", "big_purposes"
  add_foreign_key "small_purposes", "users"
  add_foreign_key "time_reports", "small_purposes"
end
