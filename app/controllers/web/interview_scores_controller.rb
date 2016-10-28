class Web::InterviewScoresController < Web::BaseController
	before_action :left_tab, :only => [:index]

	def index
	   session[:top_tab] = nil
       session[:top_tab_tipe] = "面试成绩查询"	
	   @student = current_user.student
	   @interview_score = InterviewScore.default_where(student_id:@student.id).last
	end

end