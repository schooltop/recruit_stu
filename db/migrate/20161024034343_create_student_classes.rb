class CreateStudentClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :student_classes do |t|
      t.string   "name"
      t.string  "time",                      comment: "年级：2016" 
      t.string  "obj_type",                  comment: "年级类型：EMBA" 
      t.string  "short_name",                comment: "简称：E16" 
      t.integer  "status",                   comment: "班级状态" 
      t.float  "score_line",                 comment: "分数线" 
      t.text  "comment",                     comment: "描述" 
      t.timestamps
    end
  end
end
