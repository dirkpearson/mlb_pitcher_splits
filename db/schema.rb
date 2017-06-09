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

ActiveRecord::Schema.define(version: 20170609163314) do

  create_table "batters", force: :cascade do |t|
    t.integer  "bats_id"
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "batter_name"
    t.string   "position"
    t.string   "espn_name"
    t.string   "player_id"
    t.string   "bats"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pitcher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitcher_batters", force: :cascade do |t|
    t.integer  "pitcher_id"
    t.integer  "batter_id"
    t.string   "team_code"
    t.string   "np"
    t.string   "pa"
    t.string   "ab"
    t.string   "hits"
    t.integer  "double"
    t.integer  "triple"
    t.string   "hr"
    t.integer  "runs"
    t.integer  "rbi"
    t.integer  "bb"
    t.integer  "so"
    t.integer  "sb"
    t.string   "avg"
    t.string   "obp"
    t.string   "slg"
    t.string   "ops"
    t.string   "woba"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitchers", force: :cascade do |t|
    t.integer  "pitcher_id"
    t.integer  "team_id"
    t.string   "throws"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pitcher_name"
    t.string   "espn_name"
    t.string   "player_id"
    t.string   "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "stadia", force: :cascade do |t|
    t.string   "name"
    t.string   "parkid"
    t.string   "city"
    t.string   "state"
    t.datetime "start"
    t.datetime "end"
    t.string   "league"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stadiums", force: :cascade do |t|
    t.string   "stadium_name"
    t.string   "park_id"
    t.string   "city"
    t.string   "state"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "league"
    t.integer  "team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",                  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
