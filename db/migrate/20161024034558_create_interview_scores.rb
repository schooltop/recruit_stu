class CreateInterviewScores < ActiveRecord::Migration[5.0]
  def change
    create_table :interview_scores do |t|
      t.integer  "student_id",                  comment: "学生ID" 
      t.integer  "student_class_id",            comment: "学生班级ID" 
      t.float    "score"	,                   comment: "学生面试成绩" 
      t.integer "score_order"	,               comment: "学生面试成绩排名" 
      t.datetime "interview_at"	,               comment: "学生面试时间" 
      t.datetime "show_at"	,                   comment: "学生面试成绩公布时间" 
      t.integer  "status",                      comment: "学生面试状态" 
      t.timestamps
    end
  end
end
