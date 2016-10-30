class InterviewScore < ApplicationRecord
  belongs_to :student
  extend FileHandle
  enum status: {
    "通过": 1,
    "不通过": 0
  }
  IMPORT_COLUMNS = {
	  name: 0,
    score_order: 1,
    score: 2,
    mobile: 3
  }

  EXPORT_COLUMN = {
    'student|mobile': 0,
    'student|name': 1,
    'score': 2,
    'score_order': 3
  }

    # 导入面试成绩数据
  def self.save_from_hash(hash, current_user)
      interview_scores = []
      message = "面试成绩导入成功！"
      student = Student.find_by(mobile: hash[:mobile])
      if student.present?
      interview_score = InterviewScore.find_or_initialize_by(student_id: student.id)
      interview_score.assign_attributes(student_id: student.id,
                                             score: hash[:score].to_f.round(2),
                                       score_order: hash[:score_order],
                                            status: 1)
      interview_score.save
      else
       interview_scores << hash
       message = "#{hash[:mobile]}该学生还没有创建！"
      end

      return interview_scores , message
  end

end