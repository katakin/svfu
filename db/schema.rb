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

ActiveRecord::Schema.define(:version => 20130826082058) do

  create_table "buildings", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "faculties", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "url"
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "faculties_teachers", :force => true do |t|
    t.integer "faculty_id"
    t.integer "teacher_id"
  end

  add_index "faculties_teachers", ["faculty_id"], :name => "index_faculties_teachers_on_faculty_id"
  add_index "faculties_teachers", ["teacher_id"], :name => "index_faculties_teachers_on_teacher_id"

  create_table "groups", :force => true do |t|
    t.string   "myid"
    t.string   "name",                          :null => false
    t.integer  "faculty_id"
    t.integer  "level_id"
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "groups", ["faculty_id"], :name => "index_groups_on_faculty_id"
  add_index "groups", ["level_id"], :name => "index_groups_on_level_id"

  create_table "levels", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pairs", :force => true do |t|
    t.integer  "name",                          :null => false
    t.string   "duration"
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "rooms", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "building_id"
    t.boolean  "deleted",     :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "rooms", ["building_id"], :name => "index_rooms_on_building_id"

  create_table "schedules", :force => true do |t|
    t.integer  "parity",     :default => 0,     :null => false
    t.string   "occupation"
    t.integer  "teacher_id"
    t.integer  "pair_id"
    t.integer  "room_id"
    t.integer  "subject_id"
    t.integer  "weekday_id"
    t.integer  "group_id"
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "schedules", ["group_id"], :name => "index_schedules_on_group_id"
  add_index "schedules", ["pair_id"], :name => "index_schedules_on_pair_id"
  add_index "schedules", ["room_id"], :name => "index_schedules_on_room_id"
  add_index "schedules", ["subject_id"], :name => "index_schedules_on_subject_id"
  add_index "schedules", ["teacher_id"], :name => "index_schedules_on_teacher_id"
  add_index "schedules", ["weekday_id"], :name => "index_schedules_on_weekday_id"

  create_table "subjects", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "teachers_id"
    t.boolean  "deleted",     :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "subjects_teachers", :force => true do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
  end

  add_index "subjects_teachers", ["subject_id"], :name => "index_subjects_teachers_on_subject_id"
  add_index "subjects_teachers", ["teacher_id"], :name => "index_subjects_teachers_on_teacher_id"

  create_table "teachers", :force => true do |t|
    t.string   "fio",                           :null => false
    t.integer  "faculty_id"
    t.integer  "subject_id"
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "faculty_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "weekdays", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "deleted",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
