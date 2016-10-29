class WrittenScore < ApplicationRecord
  belongs_to :student
  SCORE_COLUMNS = {
    name: 0,
    score_order: 1,
    score: 2,
    mobile: 3
  }

    # 导入笔试成绩数据
  def self.save_from_hash(hash, current_user)
      message = "笔试成绩导入成功！"
      written_scores = []
      student = Student.find_by(mobile: hash[:mobile])
      if student.present?
        written_score = WrittenScore.find_or_initialize_by(student_id: student.id)
        written_score.assign_attributes(student_id: student.id,
                                             score: hash[:score].to_f.round(2),
                                       score_order: hash[:score_order],
                                            status: 1)
        written_score.save
      end
      return written_scores , message
  end
end