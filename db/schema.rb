# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100407214417) do

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "percent",    :limit => 10, :precision => 10, :scale => 0
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "current_price",      :precision => 8, :scale => 2, :default => 0.0
    t.integer  "quantity_original"
    t.integer  "quantity_available"
    t.datetime "scheduled_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "post"
    t.datetime "post_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.string   "author"
    t.string   "affiliation"
    t.string   "email"
    t.text     "biography"
    t.string   "photo"
    t.string   "title"
    t.string   "theme"
    t.text     "abstract"
    t.text     "comments"
    t.string   "format",          :default => "proposed"
    t.string   "agreed_to_terms", :default => "no"
    t.string   "status",          :default => "pending review"
    t.datetime "start_time"
    t.integer  "duration"
    t.string   "slides"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchased_items", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "item_id"
    t.integer  "value",       :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.string   "name"
    t.string   "job_title"
    t.string   "affiliation"
    t.string   "phone"
    t.string   "email"
    t.string   "agreed_to_mailings"
    t.string   "payment_amount"
    t.string   "payment_transaction"
    t.string   "payment_code"
    t.string   "payment_status"
    t.datetime "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discount_id"
  end

  create_table "questions", :force => true do |t|
    t.integer  "item_id"
    t.string   "query"
    t.string   "acceptable_responses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "value"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.integer  "question_id"
    t.string   "response"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "icon"
    t.string   "one_line_description"
    t.text     "short_description"
    t.text     "long_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typus_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
