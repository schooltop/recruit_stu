class Web::AdmissionRecordsController < Web::BaseController
    before_action :left_tab, :only => [:index]

	def index
	   session[:top_tab] = nil
       session[:top_tab_tipe] = "录取结果查询"	
	   @student = current_user.student
	   @admission_record = AdmissionRecord.default_where(student_id:@student.id).last
	end
	
end