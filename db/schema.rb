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

ActiveRecord::Schema.define(version: 20160829125143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "category_image_file_name"
    t.string   "category_image_content_type"
    t.integer  "category_image_file_size"
    t.datetime "category_image_updated_at"
  end

  create_table "category_describes", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_describes_on_category_id", using: :btree
    t.index ["user_id"], name: "index_category_describes_on_user_id", using: :btree
    t.index ["video_id"], name: "index_category_describes_on_video_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["follower_id", "user_id"], name: "index_follows_on_follower_id_and_user_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_follows_on_user_id", using: :btree
  end

  create_table "reactions", force: :cascade do |t|
    t.integer  "rating"
    t.string   "why_watch"
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reactions_on_user_id", using: :btree
    t.index ["video_id"], name: "index_reactions_on_video_id", using: :btree
  end

  create_table "user_categories", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id", using: :btree
    t.index ["user_id", "category_id"], name: "index_user_categories_on_user_id_and_category_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_categories_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image_url"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  create_table "video_categories", id: false, force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_video_categories_on_category_id", using: :btree
    t.index ["video_id", "category_id"], name: "index_video_categories_on_video_id_and_category_id", unique: true, using: :btree
    t.index ["video_id"], name: "index_video_categories_on_video_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "url"
    t.string   "video_embed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "why_watch"
    t.string   "youtube_id"
    t.index ["user_id"], name: "index_videos_on_user_id", using: :btree
  end

  add_foreign_key "category_describes", "categories"
  add_foreign_key "category_describes", "users"
  add_foreign_key "category_describes", "videos"
  add_foreign_key "follows", "users"
  add_foreign_key "reactions", "users"
  add_foreign_key "reactions", "videos"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
  add_foreign_key "video_categories", "categories"
  add_foreign_key "video_categories", "videos"
  add_foreign_key "videos", "users"
end
