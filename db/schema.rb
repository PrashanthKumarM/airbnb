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

ActiveRecord::Schema.define(:version => 20120723052228) do

  create_table "bookings", :force => true do |t|
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "house_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", :force => true do |t|
    t.string   "desc"
    t.integer  "user_id"
    t.string   "status"
    t.string   "city"
    t.string   "address"
    t.integer  "rent"
    t.string   "r_type"
    t.integer  "B_rooms"
    t.integer  "min_stay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "houses", ["user_id"], :name => "index_houses_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "email",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
