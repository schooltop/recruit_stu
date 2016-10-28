class Student < ApplicationRecord
  has_one :interview_score
  has_one :written_score
  has_one :written_apply
  has_one :admission_record

  STUDENT_COLUMNS = {
  	  idno: 0,
	    mobile: 1,
	    name: 2,
	    card_type: 3,
	    id_card: 4,
	    email: 5,
	    name_en: 6,
	    student_no: 7
    }

    # 导入学生数据
	def self.save_from_hash(hash, current_user)
      students = []
      message = "学生导入成功！"
      student = Student.find_or_initialize_by(email: hash[:email])
      student.assign_attributes(mobile: hash[:mobile],
      	                         email: hash[:email],
                                  name: hash[:name],
                               name_en: hash[:name_en],
                               id_card: hash[:id_card].to_s.upcase,
                            student_no: hash[:student_no],
                                status: 1)
      student.save

      user = User.find_by(email: hash[:email])
      if user.blank?
      	user = User.new
        user.password = hash[:id_card].to_s.upcase
      end
      user.name =  hash[:name]
      user.name_en = hash[:name_en]
      user.id_card = hash[:id_card].to_s.upcase
      user.email = hash[:email]
      user.mobile = hash[:mobile]
      user.status = 1
      user.save
      
      return students , message
	end



end