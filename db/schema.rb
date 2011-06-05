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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110605230159) do

  create_table "allowed_question_tags", :force => true do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answer_tags", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.integer  "uid"
    t.string   "type"
    t.string   "version"
    t.string   "author"
    t.integer  "run_id"
    t.string   "answer"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expertises", :force => true do |t|
    t.integer  "uid"
    t.string   "type"
    t.string   "version"
    t.string   "author"
    t.integer  "run_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "uid"
    t.string   "type"
    t.string   "version"
    t.string   "author"
    t.integer  "run_id"
    t.string   "image_path"
    t.string   "correct_answer"
    t.string   "choice_limit"
    t.integer  "expertise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", :force => true do |t|
    t.integer  "uid"
    t.string   "type"
    t.string   "version"
    t.string   "author"
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.integer  "uid"
    t.string   "type"
    t.string   "version"
    t.string   "author"
    t.integer  "run_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
