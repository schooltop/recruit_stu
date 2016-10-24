class CreateApplySets < ActiveRecord::Migration[5.0]
  def change
    create_table :apply_sets do |t|
      t.integer  "student_class_id",             comment: "学生班级ID" 
      t.datetime   "apply_at",                   comment: "预约时间" 
      t.string   "place_where",                  comment: "预约地点" 
      t.text   "comment",                      comment: "描述" 
      t.integer  "limit_menber",                 comment: "学生人数限制" 
      t.integer  "status",                       comment: "设置状态" 
      t.datetime "show_at"	,                    comment: "开放时间"
      t.timestamps
    end
  end
end
