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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130408172617) do

  create_table "actors", :force => true do |t|
    t.string   "first_name", :limit => 250
    t.string   "last_name",  :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors_movies", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "address1",   :limit => 250
    t.string   "address2",   :limit => 250
    t.string   "city",       :limit => 250
    t.string   "state",      :limit => 250
    t.string   "zip_code",   :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_items", :force => true do |t|
    t.string  "description", :limit => 250
    t.float   "price"
    t.boolean "was_sold"
  end

  create_table "awards", :force => true do |t|
    t.integer  "year"
    t.string   "award_name", :limit => 250
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", :force => true do |t|
    t.string   "card_type",           :limit => 250
    t.string   "number",              :limit => 250
    t.string   "expiration_month",    :limit => 2
    t.string   "expiration_year",     :limit => 4
    t.string   "verification_number", :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ex0318_users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "ex0320_users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "fruits", :force => true do |t|
    t.string   "name",           :limit => 250
    t.string   "image_filename", :limit => 250
    t.float    "usd_per_lb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "title",      :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state",           :limit => 2
    t.string   "price",           :limit => 12
    t.integer  "num_bedrooms"
    t.integer  "num_stories"
    t.string   "num_square_feet", :limit => 7
    t.string   "image_url"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "property_admins", :force => true do |t|
    t.string "username"
    t.string "password"
  end

  create_table "songs", :force => true do |t|
    t.date     "date"
    t.string   "title",      :limit => 250
    t.string   "content",    :limit => 2500
    t.integer  "priority"
    t.boolean  "final"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "title",      :limit => 250
    t.boolean  "void"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "us_cities", :force => true do |t|
    t.string "name",      :limit => 250
    t.float  "latitude"
    t.float  "longitude"
    t.string "time_zone", :limit => 250
  end

  create_table "us_states", :force => true do |t|
    t.string   "name",         :limit => 250
    t.string   "abbreviation", :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 250
    t.string   "password_digest", :limit => 250
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "verses", :force => true do |t|
    t.date     "date"
    t.string   "tag",        :limit => 250
    t.string   "content",    :limit => 750
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "z_text_areas", :force => true do |t|
    t.string   "content",    :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
