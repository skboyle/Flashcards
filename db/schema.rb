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

ActiveRecord::Schema[8.0].define(version: 2025_11_30_134558) do
  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flashcards", force: :cascade do |t|
    t.integer "deck_id", null: false
    t.text "front"
    t.text "back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_flashcards_on_deck_id"
  end

  create_table "quiz_attempt_scores", force: :cascade do |t|
    t.integer "quiz_attempt_id", null: false
    t.integer "flashcard_id", null: false
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flashcard_id"], name: "index_quiz_attempt_scores_on_flashcard_id"
    t.index ["quiz_attempt_id"], name: "index_quiz_attempt_scores_on_quiz_attempt_id"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.integer "deck_id", null: false
    t.integer "correct_count"
    t.integer "total_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_quiz_attempts_on_deck_id"
  end

  add_foreign_key "flashcards", "decks"
  add_foreign_key "quiz_attempt_scores", "flashcards"
  add_foreign_key "quiz_attempt_scores", "quiz_attempts"
  add_foreign_key "quiz_attempts", "decks"
end
