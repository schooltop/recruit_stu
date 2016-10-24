class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
    	t.string   "name"
        t.string   "name_en"
        t.string   "id_card"
	    t.string   "email",                  default: "",    null: false
	    t.string   "mobile"
	    t.string   "telephone"
        t.string   "student_no"
        t.integer  "status",                  comment: "学生状态" 
        t.integer  "apply_status",                  comment: "学生预约状态" 
	    t.timestamps
    end
  end
end
