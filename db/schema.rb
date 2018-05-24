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

ActiveRecord::Schema.define(version: 2018_05_24_182739) do

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "department"
    t.integer "course_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instructor_id"
    t.integer "user_id"
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_instructors_on_course_id"
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "username"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "review_instructors", force: :cascade do |t|
    t.integer "review_id"
    t.integer "instructor_id"
    t.index ["instructor_id"], name: "index_review_instructors_on_instructor_id"
    t.index ["review_id"], name: "index_review_instructors_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "course_quality"
    t.integer "instructor_quality"
    t.integer "amount_learned"
    t.integer "work_amount"
    t.integer "users_id"
    t.integer "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.text "comment"
    t.integer "user_id"
    t.integer "instructor_id"
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["courses_id"], name: "index_reviews_on_courses_id"
    t.index ["instructor_id"], name: "index_reviews_on_instructor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
