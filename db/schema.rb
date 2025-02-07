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

ActiveRecord::Schema[7.2].define(version: 2025_02_05_185200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.integer "question_type", null: false
    t.text "content", null: false
    t.text "options"
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_questions_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "nome", null: false
    t.string "semestre", null: false
    t.string "publicoAlvo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "matricula", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["matricula"], name: "index_users_on_matricula", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "questions", "templates"
end
