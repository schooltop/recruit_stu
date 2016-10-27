class Web::WrittenScoresController < Web::BaseController

	def index
	   @student = current_user.student
	   @written_score = WrittenScore.default_where(student_id:@student.id).last
	end

end