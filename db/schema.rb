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

ActiveRecord::Schema.define(version: 20171104135437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_items", force: :cascade, comment: "シール貼り付け欄" do |t|
    t.bigint "board_id", null: false, comment: "質問"
    t.string "title", default: "", null: false, comment: "回答"
    t.integer "position", default: 0, null: false, comment: "表示順"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_items_on_board_id"
  end

  create_table "boards", force: :cascade, comment: "シール投票用ボード" do |t|
    t.string "title", default: "", null: false, comment: "質問"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "items_count", default: 0, null: false, comment: "貼り付け欄の数"
  end

  add_foreign_key "board_items", "boards"
end
