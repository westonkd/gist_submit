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

ActiveRecord::Schema.define(version: 2019_07_01_164126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "lti_id", null: false
    t.datetime "due_date"
    t.string "title"
    t.string "lti_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["due_date"], name: "index_assignments_on_due_date"
    t.index ["lti_id"], name: "index_assignments_on_lti_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "client_credentials", force: :cascade do |t|
    t.string "client_id", null: false
    t.jsonb "private_jwk"
    t.jsonb "public_jwk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "platform_id"
    t.index ["client_id"], name: "index_client_credentials_on_client_id"
    t.index ["platform_id"], name: "index_client_credentials_on_platform_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "lti_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["lti_id"], name: "index_courses_on_lti_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "public_key_uri", null: false
    t.string "authorization_uri", null: false
    t.string "iss", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grant_url"
  end

  create_table "scores", force: :cascade do |t|
    t.float "score"
    t.bigint "assignment_id"
    t.bigint "user_id"
    t.string "line_item_url"
    t.string "url"
    t.index ["assignment_id"], name: "index_scores_on_assignment_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "assignment_id"
    t.bigint "user_id"
    t.string "url"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["assignment_id"], name: "index_submissions_on_assignment_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "avatar_url", null: false
    t.string "email", null: false
    t.string "uid", null: false
    t.string "provider", null: false
    t.string "oauth_token"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lti_id"
    t.bigint "client_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["uid"], name: "index_users_on_uid"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "assignments", "courses"
  add_foreign_key "assignments", "users"
  add_foreign_key "client_credentials", "platforms"
  add_foreign_key "courses", "users"
  add_foreign_key "scores", "assignments"
  add_foreign_key "scores", "users"
  add_foreign_key "submissions", "assignments"
  add_foreign_key "submissions", "users"
end
