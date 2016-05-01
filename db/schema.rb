# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160430215244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "archived",   default: false
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "recipe_id"
  end

  add_index "categories_recipes", ["category_id"], name: "index_categories_recipes_on_category_id", using: :btree
  add_index "categories_recipes", ["recipe_id"], name: "index_categories_recipes_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.text     "title"
    t.text     "directions"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_id"
    t.string   "image_filename"
    t.string   "image_size"
    t.string   "image_content_type"
    t.text     "ingredients"
    t.text     "notes"
    t.text     "source"
    t.integer  "calories"
    t.string   "time"
    t.string   "yield"
    t.boolean  "archived",           default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
