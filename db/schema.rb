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

ActiveRecord::Schema.define(version: 20151223204252) do

  create_table "CCS", id: false, force: :cascade do |t|
    t.integer "staff_id",    limit: 4, null: false
    t.integer "class_id",    limit: 4, null: false
    t.integer "course_code", limit: 4, null: false
  end

  add_index "CCS", ["class_id"], name: "class_id", using: :btree
  add_index "CCS", ["course_code"], name: "course_code", using: :btree

  create_table "CLASS", primary_key: "class_id", force: :cascade do |t|
    t.string  "year",          limit: 5,  null: false
    t.string  "type",          limit: 15, null: false
    t.integer "department_id", limit: 4,  null: false
  end

  add_index "CLASS", ["department_id"], name: "department_id", unique: true, using: :btree

  create_table "COURSE", primary_key: "course_code", force: :cascade do |t|
    t.string  "course_name",   limit: 20, null: false
    t.integer "department_id", limit: 4,  null: false
  end

  add_index "COURSE", ["course_name"], name: "course_name", unique: true, using: :btree
  add_index "COURSE", ["department_id"], name: "department_id", unique: true, using: :btree

  create_table "DEPARTMENT", primary_key: "department_id", force: :cascade do |t|
    t.string  "department_name", limit: 45, null: false
    t.integer "lord_id",         limit: 4
  end

  add_index "DEPARTMENT", ["lord_id"], name: "lord_id", unique: true, using: :btree

  create_table "EVALUATECOURSE", primary_key: "student_id", force: :cascade do |t|
    t.integer "course_code",    limit: 4,    null: false
    t.integer "a1",             limit: 4,    null: false
    t.integer "a2",             limit: 4,    null: false
    t.integer "a3",             limit: 4,    null: false
    t.integer "a4",             limit: 4,    null: false
    t.integer "a5",             limit: 4,    null: false
    t.string  "other_comments", limit: 1000
  end

  add_index "EVALUATECOURSE", ["course_code"], name: "EV_SUBJ_subject_id", using: :btree

  create_table "EVALUATESTAFF", id: false, force: :cascade do |t|
    t.integer "student_id",     limit: 4,    null: false
    t.integer "staff_id",       limit: 4,    null: false
    t.integer "course_code",    limit: 4,    null: false
    t.integer "a1",             limit: 4,    null: false
    t.integer "a2",             limit: 4,    null: false
    t.integer "a3",             limit: 4,    null: false
    t.integer "a4",             limit: 4,    null: false
    t.integer "a5",             limit: 4,    null: false
    t.string  "other_comments", limit: 1000
  end

  add_index "EVALUATESTAFF", ["course_code"], name: "EVALUATE_3", using: :btree
  add_index "EVALUATESTAFF", ["staff_id"], name: "EVALUATE_2", using: :btree

  create_table "PERSON", primary_key: "person_id", force: :cascade do |t|
    t.string  "sex",       limit: 7
    t.integer "ssn",       limit: 4,  null: false
    t.string  "name",      limit: 45, null: false
    t.string  "birthdate", limit: 15
    t.string  "email",     limit: 45, null: false
    t.string  "password",  limit: 45, null: false
    t.integer "token",     limit: 4
  end

  add_index "PERSON", ["email"], name: "email", unique: true, using: :btree
  add_index "PERSON", ["ssn"], name: "ssn", unique: true, using: :btree

  create_table "PROFESSOR", primary_key: "prof_id", force: :cascade do |t|
    t.string "position", limit: 45
  end

  create_table "STAFF", primary_key: "staff_id", force: :cascade do |t|
    t.integer "department_id", limit: 4, null: false
  end

  add_index "STAFF", ["department_id"], name: "staff_dept_id", using: :btree

  create_table "STUDENT", primary_key: "student_id", force: :cascade do |t|
    t.integer "class_id", limit: 4, null: false
  end

  add_index "STUDENT", ["class_id"], name: "class_id_4", using: :btree

  create_table "TA", primary_key: "TA_id", force: :cascade do |t|
    t.string  "Degree",       limit: 45
    t.integer "Years_of_exp", limit: 4
  end

  add_foreign_key "CCS", "CLASS", column: "class_id", primary_key: "class_id", name: "class_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CCS", "COURSE", column: "course_code", primary_key: "course_code", name: "course_code", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CCS", "PERSON", column: "staff_id", primary_key: "person_id", name: "staff_id_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CLASS", "DEPARTMENT", column: "department_id", primary_key: "department_id", name: "class_dept_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "COURSE", "DEPARTMENT", column: "department_id", primary_key: "department_id", name: "course_dept_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DEPARTMENT", "PROFESSOR", column: "lord_id", primary_key: "prof_id", name: "department_lord_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EVALUATECOURSE", "COURSE", column: "course_code", primary_key: "course_code", name: "EV_SUBJ_subject_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EVALUATECOURSE", "STUDENT", column: "student_id", primary_key: "student_id", name: "EV_SUBJ_student_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EVALUATESTAFF", "COURSE", column: "course_code", primary_key: "course_code", name: "EVALUATE_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EVALUATESTAFF", "PERSON", column: "staff_id", primary_key: "person_id", name: "EVALUATE_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EVALUATESTAFF", "PERSON", column: "student_id", primary_key: "person_id", name: "EVALUATE_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PROFESSOR", "STAFF", column: "prof_id", primary_key: "staff_id", name: "prof_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "STAFF", "DEPARTMENT", column: "department_id", primary_key: "department_id", name: "staff_dept_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "STAFF", "PERSON", column: "staff_id", primary_key: "person_id", name: "staff_person_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "STUDENT", "CLASS", column: "class_id", primary_key: "class_id", name: "class_id_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "STUDENT", "PERSON", column: "student_id", primary_key: "person_id", name: "student_id_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "TA", "STAFF", column: "TA_id", primary_key: "staff_id", name: "staff_id", on_update: :cascade, on_delete: :cascade
end
