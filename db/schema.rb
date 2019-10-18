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

ActiveRecord::Schema.define(version: 2019_10_18_112414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_articles", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.string "url"
    t.string "sku"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_articles_on_product_id"
  end

  create_table "product_photos", force: :cascade do |t|
    t.bigint "product_article_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_article_id"], name: "index_product_photos_on_product_article_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.bigint "product_article_id"
    t.bigint "size_id"
    t.string "sku"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_article_id"], name: "index_product_sizes_on_product_article_id"
    t.index ["size_id"], name: "index_product_sizes_on_size_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "related_articles", force: :cascade do |t|
    t.bigint "original_article_id"
    t.bigint "related_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_article_id"], name: "index_related_articles_on_original_article_id"
    t.index ["related_article_id"], name: "index_related_articles_on_related_article_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
