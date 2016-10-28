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

ActiveRecord::Schema.define(version: 20161028114335) do

  create_table "admission_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id",                                    comment: "学生ID"
    t.integer  "interview_score_id",                            comment: "学生面试"
    t.integer  "written_score_id",                              comment: "学生笔试"
    t.integer  "status",                                        comment: "学生录取状态"
    t.text     "comment",            limit: 65535,              comment: "描述"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "apply_sets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_class_id",                            comment: "学生班级ID"
    t.datetime "apply_at",                                    comment: "预约时间"
    t.string   "place_where",                                 comment: "预约地点"
    t.text     "comment",          limit: 65535,              comment: "描述"
    t.integer  "limit_menber",                                comment: "学生人数限制"
    t.integer  "status",                                      comment: "设置状态"
    t.datetime "show_at",                                     comment: "开放时间"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "end_apply_at"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "path",                         comment: "附件文件名"
    t.string   "name",                         comment: "附件原文件名"
    t.string   "file_size",                    comment: "附件大小"
    t.string   "content_type",                 comment: "附件后缀名"
    t.string   "attachment_type",              comment: "关联模块"
    t.integer  "attachment_id",                comment: "关联模块ID"
    t.integer  "upload_by",                    comment: "上传人"
    t.string   "column_name",                  comment: "拓展字断"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "interview_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id",                               comment: "学生ID"
    t.integer  "student_class_id",                         comment: "学生班级ID"
    t.float    "score",            limit: 24,              comment: "学生面试成绩"
    t.integer  "score_order",                              comment: "学生面试成绩排名"
    t.datetime "interview_at",                             comment: "学生面试时间"
    t.datetime "show_at",                                  comment: "学生面试成绩公布时间"
    t.integer  "status",                                   comment: "学生面试状态"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "action_tag"
    t.string   "function_tag"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "permissions_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "permission_id"
    t.integer "user_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id", using: :btree
    t.index ["user_id"], name: "index_permissions_roles_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "student_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "time",                                  comment: "年级：2016"
    t.string   "obj_type",                              comment: "年级类型：EMBA"
    t.string   "short_name",                            comment: "简称：E16"
    t.integer  "status",                                comment: "班级状态"
    t.float    "score_line", limit: 24,                 comment: "分数线"
    t.text     "comment",    limit: 65535,              comment: "描述"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "name_en"
    t.string   "id_card"
    t.string   "email",        default: "", null: false
    t.string   "mobile"
    t.string   "telephone"
    t.string   "student_no"
    t.integer  "status",                                 comment: "学生状态"
    t.integer  "apply_status",                           comment: "学生预约状态"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "name_en"
    t.string   "id_card"
    t.string   "email",                  default: "",   null: false
    t.string   "mobile"
    t.string   "telephone"
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_valid",               default: true
    t.integer  "status",                                             comment: "用户状态"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "written_applies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id",                            comment: "学生ID"
    t.integer  "apply_set_id",                          comment: "申请ID"
    t.string   "name",                                  comment: "学生名字"
    t.string   "cat_no",                                comment: "车号"
    t.integer  "status",       default: 0,              comment: "学生申请状态"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "written_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id",                               comment: "学生ID"
    t.integer  "student_class_id",                         comment: "学生班级ID"
    t.float    "score",            limit: 24,              comment: "学生笔试成绩"
    t.integer  "score_order",                              comment: "学生笔试成绩排名"
    t.string   "score_comment",                            comment: "学生笔试相关说明"
    t.datetime "interview_at",                             comment: "学生笔试时间"
    t.datetime "show_at",                                  comment: "学生笔试成绩公布时间"
    t.integer  "status",                                   comment: "学生笔试状态"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
