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

ActiveRecord::Schema[7.0].define(version: 2023_08_31_152947) do
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
    t.bigint "country_id", null: false
    t.text "map_url"
    t.bigint "counter", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.string "comment", null: false
    t.integer "response_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "fk_rails_2fd19c0db7"
    t.index ["user_id"], name: "fk_rails_03de2dc08c"
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "region_id", null: false
    t.text "map_url"
    t.bigint "counter", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_countries_on_region_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "country_id", null: false
    t.bigint "city_id", null: false
    t.bigint "category_id", null: false
    t.string "caption_image", default: "", null: false
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["city_id"], name: "index_posts_on_city_id"
    t.index ["country_id"], name: "index_posts_on_country_id"
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
    t.bigint "post_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_tag_mappings_on_post_id"
    t.index ["tag_id"], name: "index_tag_mappings_on_tag_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "counter", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "countries", "regions"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "cities"
  add_foreign_key "posts", "countries"
  add_foreign_key "posts", "users"
  add_foreign_key "tag_mappings", "posts"
  add_foreign_key "tag_mappings", "tags"
end
