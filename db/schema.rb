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

ActiveRecord::Schema.define(version: 20151215120728) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "project_id",  limit: 4
    t.integer  "branch_id",   limit: 4
    t.decimal  "budget",                    precision: 10
    t.text     "description", limit: 65535
    t.date     "from"
    t.date     "to"
    t.integer  "repeated",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "activity_locations", force: :cascade do |t|
    t.integer  "activity_id", limit: 4
    t.integer  "location_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "activity_members", force: :cascade do |t|
    t.integer  "activity_id", limit: 4
    t.integer  "member_id",   limit: 4
    t.integer  "role_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "state_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "donors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "email",       limit: 255
    t.string   "phone1",      limit: 255
    t.string   "phone2",      limit: 255
    t.string   "fax",         limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "state_id",   limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "gender",              limit: 4
    t.date     "joined_at"
    t.string   "email",               limit: 255
    t.string   "mobile",              limit: 255
    t.string   "address",             limit: 255
    t.integer  "education",           limit: 4
    t.text     "bio",                 limit: 65535
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id",           limit: 4
    t.integer  "role_id",             limit: 4
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "profession_id",       limit: 4
    t.integer  "organization_id",     limit: 4
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "website",           limit: 255
    t.string   "subdomain",         limit: 255
    t.string   "email",             limit: 255
    t.string   "phone1",            limit: 255
    t.string   "phone2",            limit: 255
    t.string   "fax",               limit: 255
    t.string   "address",           limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",        limit: 4
    t.integer  "updated_by",        limit: 4
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "professions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_attachments", force: :cascade do |t|
    t.integer  "attachment_id",           limit: 4
    t.integer  "project_id",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  create_table "project_donors", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "donor_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "project_locations", force: :cascade do |t|
    t.integer  "project_id",  limit: 4
    t.integer  "location_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "project_members", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "member_id",  limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "project_milestones", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.decimal  "expences",                  precision: 12, scale: 2, default: 0.0
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "project_partners", force: :cascade do |t|
    t.integer  "project_id",      limit: 4
    t.integer  "organization_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",      limit: 4
    t.integer  "updated_by",      limit: 4
  end

  create_table "project_roles", force: :cascade do |t|
    t.integer  "role_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.integer  "member_id",   limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                           limit: 255
    t.decimal  "budget",                                       precision: 12, scale: 2, default: 0.0
    t.date     "from"
    t.date     "to"
    t.text     "goal",                           limit: 65535
    t.text     "description",                    limit: 65535
    t.integer  "branch_id",                      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",                     limit: 4
    t.integer  "updated_by",                     limit: 4
    t.decimal  "overall_expences",                             precision: 12, scale: 2, default: 0.0
    t.string   "required_document_file_name",    limit: 255
    t.string   "required_document_content_type", limit: 255
    t.integer  "required_document_file_size",    limit: 4
    t.datetime "required_document_updated_at"
  end

  create_table "public_activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "public_activities", ["owner_id", "owner_type"], name: "index_public_activities_on_owner_id_and_owner_type", using: :btree
  add_index "public_activities", ["recipient_id", "recipient_type"], name: "index_public_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "public_activities", ["trackable_id", "trackable_type"], name: "index_public_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "full_name",              limit: 255
    t.string   "mobile",                 limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "password_digest",        limit: 255
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",             limit: 4
    t.integer  "updated_by",             limit: 4
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "locale",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
