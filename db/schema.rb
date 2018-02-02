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

ActiveRecord::Schema.define(version: 20180202231902) do

  create_table "applications", force: :cascade do |t|
    t.text     "cover_letter"
    t.string   "status",         default: "Draft"
    t.datetime "submit_date"
    t.integer  "user_id"
    t.integer  "job_listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_listings", force: :cascade do |t|
    t.string   "company"
    t.string   "title"
    t.text     "summary"
    t.text     "description"
    t.text     "qualifications"
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "start_date"
    t.string   "end_date",   default: "Present"
    t.string   "title"
    t.string   "employer"
    t.string   "location"
    t.text     "experience"
    t.integer  "ranking"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
