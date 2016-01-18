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

ActiveRecord::Schema.define(version: 20160118121215) do

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
    t.integer  "location_id", limit: 4
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

  create_table "activity_translations", force: :cascade do |t|
    t.integer  "activity_id", limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
  end

  add_index "activity_translations", ["activity_id"], name: "index_activity_translations_on_activity_id", using: :btree
  add_index "activity_translations", ["locale"], name: "index_activity_translations_on_locale", using: :btree

  create_table "branch_translations", force: :cascade do |t|
    t.integer  "branch_id",   limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
  end

  add_index "branch_translations", ["branch_id"], name: "index_branch_translations_on_branch_id", using: :btree
  add_index "branch_translations", ["locale"], name: "index_branch_translations_on_locale", using: :btree

  create_table "branches", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "state_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
  end

  create_table "donor_translations", force: :cascade do |t|
    t.integer  "donor_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
  end

  add_index "donor_translations", ["donor_id"], name: "index_donor_translations_on_donor_id", using: :btree
  add_index "donor_translations", ["locale"], name: "index_donor_translations_on_locale", using: :btree

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

  create_table "location_translations", force: :cascade do |t|
    t.integer  "location_id", limit: 4,   null: false
    t.string   "locale",      limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",        limit: 255
  end

  add_index "location_translations", ["locale"], name: "index_location_translations_on_locale", using: :btree
  add_index "location_translations", ["location_id"], name: "index_location_translations_on_location_id", using: :btree

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
    t.string   "education",           limit: 255
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
    t.integer  "user_id",             limit: 4
  end

  create_table "organization_translations", force: :cascade do |t|
    t.integer  "organization_id", limit: 4,     null: false
    t.string   "locale",          limit: 255,   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
  end

  add_index "organization_translations", ["locale"], name: "index_organization_translations_on_locale", using: :btree
  add_index "organization_translations", ["organization_id"], name: "index_organization_translations_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "website",             limit: 255
    t.string   "subdomain",           limit: 255
    t.string   "email",               limit: 255
    t.string   "phone1",              limit: 255
    t.string   "phone2",              limit: 255
    t.string   "fax",                 limit: 255
    t.string   "address",             limit: 255
    t.text     "description",         limit: 65535
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.string   "logo_file_name",      limit: 255
    t.string   "logo_content_type",   limit: 255
    t.integer  "logo_file_size",      limit: 4
    t.datetime "logo_updated_at"
    t.string   "trello_member_token", limit: 255
  end

  create_table "profession_translations", force: :cascade do |t|
    t.integer  "profession_id", limit: 4,   null: false
    t.string   "locale",        limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",          limit: 255
  end

  add_index "profession_translations", ["locale"], name: "index_profession_translations_on_locale", using: :btree
  add_index "profession_translations", ["profession_id"], name: "index_profession_translations_on_profession_id", using: :btree

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

  create_table "project_milestone_translations", force: :cascade do |t|
    t.integer  "project_milestone_id", limit: 4,     null: false
    t.string   "locale",               limit: 255,   null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "name",                 limit: 255
    t.text     "description",          limit: 65535
  end

  add_index "project_milestone_translations", ["locale"], name: "index_project_milestone_translations_on_locale", using: :btree
  add_index "project_milestone_translations", ["project_milestone_id"], name: "index_project_milestone_translations_on_project_milestone_id", using: :btree

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

  create_table "project_translations", force: :cascade do |t|
    t.integer  "project_id",  limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
  end

  add_index "project_translations", ["locale"], name: "index_project_translations_on_locale", using: :btree
  add_index "project_translations", ["project_id"], name: "index_project_translations_on_project_id", using: :btree

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
    t.integer  "location_id",                    limit: 4
    t.string   "trello_board_id",                limit: 255
    t.integer  "organization_id",                limit: 4
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

  create_table "role_translations", force: :cascade do |t|
    t.integer  "role_id",    limit: 4,   null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  add_index "role_translations", ["locale"], name: "index_role_translations_on_locale", using: :btree
  add_index "role_translations", ["role_id"], name: "index_role_translations_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.text     "permissions", limit: 65535
  end

  create_table "state_translations", force: :cascade do |t|
    t.integer  "state_id",   limit: 4,   null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  add_index "state_translations", ["locale"], name: "index_state_translations_on_locale", using: :btree
  add_index "state_translations", ["state_id"], name: "index_state_translations_on_state_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",            limit: 255
    t.string  "color_code",      limit: 255, default: "#5bc0de"
    t.integer "projects_count",  limit: 4
    t.integer "members_count",   limit: 4
    t.integer "importers_count", limit: 4
  end

  create_table "user_translations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "full_name",  limit: 255
  end

  add_index "user_translations", ["locale"], name: "index_user_translations_on_locale", using: :btree
  add_index "user_translations", ["user_id"], name: "index_user_translations_on_user_id", using: :btree

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
    t.string   "language",               limit: 255
    t.integer  "role_id",                limit: 4,   default: 1
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
