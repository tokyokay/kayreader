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

ActiveRecord::Schema.define(:version => 20120831023128) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_sites", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "site_id"
  end

  add_index "categories_sites", ["category_id"], :name => "index_categories_sites_on_category_id"
  add_index "categories_sites", ["site_id"], :name => "index_categories_sites_on_site_id"

  create_table "details", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.string   "title",                         :null => false
    t.string   "message"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "link"
    t.boolean  "read",       :default => false
    t.boolean  "blocked",    :default => false
  end

  add_index "details", ["site_id"], :name => "index_details_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "site_name",  :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rssurl"
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 12,  :null => false
    t.string   "password",   :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
