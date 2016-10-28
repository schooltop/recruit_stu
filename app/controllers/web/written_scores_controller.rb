class Web::WrittenScoresController < Web::BaseController
    before_action :left_tab, :only => [:index]

	def index
	   session[:top_tab] = nil
       session[:top_tab_tipe] = "笔试成绩查询"
	   @student = current_user.student
	   @written_score = WrittenScore.default_where(student_id:@student.id).last
	end

end