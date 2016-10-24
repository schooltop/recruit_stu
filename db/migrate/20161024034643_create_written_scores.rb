class CreateWrittenScores < ActiveRecord::Migration[5.0]
  def change
    create_table :written_scores do |t|
      t.integer  "student_id",                  comment: "学生ID" 
      t.integer  "student_class_id",            comment: "学生班级ID" 
      t.float    "score"	,                   comment: "学生笔试成绩" 
      t.integer "score_order"	,               comment: "学生笔试成绩排名" 
      t.string   "score_comment",               comment: "学生笔试相关说明"
      t.datetime "interview_at"	,               comment: "学生笔试时间" 
      t.datetime "show_at"	,                   comment: "学生笔试成绩公布时间" 
      t.integer  "status",                      comment: "学生笔试状态" 
      t.timestamps
    end
  end
end
