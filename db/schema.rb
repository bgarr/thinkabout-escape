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

ActiveRecord::Schema[7.2].define(version: 2025_03_27_201710) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "game_plays", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id"
    t.jsonb "solution_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_plays_on_game_id"
    t.index ["player_id"], name: "index_game_plays_on_player_id"
  end

  create_table "game_rooms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_rooms_on_game_id"
    t.index ["room_id"], name: "index_game_rooms_on_room_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["name"], name: "index_games_on_name", unique: true
    t.index ["owner_id"], name: "index_games_on_owner_id"
  end

  create_table "item_placements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "item_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_item_placements_on_game_id"
    t.index ["item_slot_id"], name: "index_item_placements_on_item_slot_id"
  end

  create_table "item_slots", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "path_id"
    t.bigint "item_id"
    t.float "path_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_slots_on_item_id"
    t.index ["path_id"], name: "index_item_slots_on_path_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.string "logic"
    t.bigint "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_items_on_puzzle_id"
  end

  create_table "paths", force: :cascade do |t|
    t.string "name"
    t.bigint "room_id", null: false
    t.jsonb "curve"
    t.string "logic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_paths_on_room_id"
  end

  create_table "puzzle_solutions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "game_play_id", null: false
    t.bigint "puzzle_id", null: false
    t.jsonb "solution_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_play_id"], name: "index_puzzle_solutions_on_game_play_id"
    t.index ["puzzle_id"], name: "index_puzzle_solutions_on_puzzle_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "name"
    t.string "logic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id", null: false
    t.boolean "public", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rooms_on_name", unique: true
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "game_plays", "users", column: "player_id"
  add_foreign_key "game_rooms", "games"
  add_foreign_key "game_rooms", "rooms"
  add_foreign_key "games", "users", column: "owner_id"
  add_foreign_key "rooms", "users", column: "owner_id"
end
