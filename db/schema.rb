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

ActiveRecord::Schema[7.0].define(version: 2023_08_30_163024) do
  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.text "map_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "fk_rails_1e28850acb"
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.text "map_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", charset: "utf8mb4", force: :cascade do |t|
    t.text "url", null: false
    t.bigint "posts_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_images_on_posts_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "countries_id", null: false
    t.bigint "regions_id", null: false
    t.bigint "cities_id", null: false
    t.bigint "categories_id", null: false
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_posts_on_categories_id"
    t.index ["cities_id"], name: "index_posts_on_cities_id"
    t.index ["countries_id"], name: "index_posts_on_countries_id"
    t.index ["regions_id"], name: "index_posts_on_regions_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "regions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.text "map_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_mappings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "posts_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_tag_mappings_on_posts_id"
    t.index ["tag_id"], name: "index_tag_mappings_on_tag_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "images", "posts", column: "posts_id"
  add_foreign_key "posts", "categories", column: "categories_id"
  add_foreign_key "posts", "cities", column: "cities_id"
  add_foreign_key "posts", "countries", column: "countries_id"
  add_foreign_key "posts", "regions", column: "regions_id"
  add_foreign_key "posts", "users"
  add_foreign_key "tag_mappings", "posts", column: "posts_id"
  add_foreign_key "tag_mappings", "tags"
end
