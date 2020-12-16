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

ActiveRecord::Schema.define(version: 2020_11_18_024546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "box_games", force: :cascade do |t|
    t.integer "box_id"
    t.integer "game_id"
    t.integer "rating"
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "price"
    t.integer "max_players"
    t.integer "min_players"
    t.integer "play_time"
    t.string "description"
    t.string "genre"
    t.string "company"
    t.float "rating"
    t.integer "rank"
    t.integer "board_score"
    t.integer "party_score"
    t.integer "card_score"
    t.integer "fantasy_score"
    t.integer "economic_score"
    t.integer "territory_score"
    t.integer "players_score"
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "rating"
  end

  create_table "user_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "address"
    t.integer "zip"
    t.boolean "subscribed"
    t.float "board_score"
    t.float "party_score"
    t.float "card_score"
    t.float "fantasy_score"
    t.float "economic_score"
    t.float "territory_score"
    t.float "players_score"
  end

end
