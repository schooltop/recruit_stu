class CreateAdmissionRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :admission_records do |t|
      t.integer  "student_id",                  comment: "学生ID" 
      t.integer  "interview_score_id",          comment: "学生面试"
      t.integer  "written_score_id",            comment: "学生笔试"
      t.integer  "status",                      comment: "学生录取状态"
      t.text   "comment",                      comment: "描述" 
      t.timestamps
    end
  end
end
