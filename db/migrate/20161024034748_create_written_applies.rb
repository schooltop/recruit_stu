class CreateWrittenApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :written_applies do |t|
      t.integer  "student_id",                  comment: "学生ID" 
      t.integer  "apply_set_id",                comment: "申请ID" 	
      t.string   "name",                        comment: "学生名字" 
      t.string   "cat_no",                      comment: "车号" 
      t.integer  "status", default: 0,      comment: "学生申请状态" 
      t.timestamps
    end
  end
end
