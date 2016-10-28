class InterviewScore < ApplicationRecord
  belongs_to :student

 InterviewScore_COLUMNS = {
  	  mobile: 0,
	    name: 1,
	    score: 2,
	    score_order: 3
    }

    # 导入面试成绩数据
	def self.save_from_hash(hash, current_user)
      interview_scores = []
      message = "面试成绩导入成功！"
      student = Student.find_by(mobile: hash[:mobile])
      interview_score = InterviewScore.find_or_initialize_by(student_id: student.id)
      interview_score.assign_attributes(student_id: student.id,
      	                          student_class_id: student.student_class_id,
                                             score: hash[:score].to_f,
                                       score_order: hash[:score_order],
                                            status: 1)
      interview_score.save

      return interview_scores , message
	end

end