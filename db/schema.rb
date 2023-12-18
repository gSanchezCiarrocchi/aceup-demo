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

ActiveRecord::Schema.define(version: 2023_12_17_184546) do

  create_table "clients", id: :string, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
  end

  create_table "coaches", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.integer "hourly_rate_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_coaches_on_name", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.string "coach_id"
    t.string "client_id"
    t.datetime "start"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_reference :sessions, :client_id, foreign_key: { to_table: :clients }
  add_reference :sessions, :coach_id,  foreign_key: { to_table: :coaches }
end
