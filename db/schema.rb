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

ActiveRecord::Schema.define(version: 20170919234252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct", default: false
    t.index ["character_id"], name: "index_answers_on_character_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "correct_answer_id"
    t.integer "responses_count", default: 0
    t.integer "correct_count", default: 0
    t.index ["correct_answer_id"], name: "index_questions_on_correct_answer_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct", default: false
    t.index ["answer_id"], name: "index_responses_on_answer_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  add_foreign_key "answers", "characters"
  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "answers", column: "correct_answer_id"
  add_foreign_key "responses", "answers"
  add_foreign_key "responses", "questions"
end
