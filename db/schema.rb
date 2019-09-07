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

ActiveRecord::Schema.define(version: 2019_09_07_102155) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_number", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building_name"
    t.integer "building_tel"
    t.bigint "user_id", null: false
    t.integer "prefecture_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cards", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "category_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "size_id"
    t.index ["category_id"], name: "index_category_sizes_on_category_id"
    t.index ["size_id"], name: "index_category_sizes_on_size_id"
  end

  create_table "delivery_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_fees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_item_comments_on_item_id"
    t.index ["user_id"], name: "index_item_comments_on_user_id"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["image"], name: "index_item_images_on_image"
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "item_states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "brand"
    t.bigint "category_id"
    t.bigint "size_id"
    t.bigint "item_state_id"
    t.bigint "delivery_fee_id"
    t.bigint "delivery_method_id"
    t.bigint "delivery_day_id"
    t.bigint "user_id"
    t.integer "prefecture_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["delivery_day_id"], name: "index_items_on_delivery_day_id"
    t.index ["delivery_fee_id"], name: "index_items_on_delivery_fee_id"
    t.index ["delivery_method_id"], name: "index_items_on_delivery_method_id"
    t.index ["item_state_id"], name: "index_items_on_item_state_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.text "introduction"
    t.string "avatar"
    t.integer "phone_number", null: false
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "category_sizes", "categories"
  add_foreign_key "category_sizes", "sizes"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "delivery_days"
  add_foreign_key "items", "delivery_fees"
  add_foreign_key "items", "delivery_methods"
  add_foreign_key "items", "item_states"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users"
end
