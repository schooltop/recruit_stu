class Web::InterviewScoresController < Web::BaseController

	def index
	   @student = current_user.student
	   @interview_score = InterviewScore.default_where(student_id:@student.id).last
	end

end