class Web::AdmissionRecordsController < Web::BaseController

	def index
	   @student = current_user.student
	   @admission_record = AdmissionRecord.default_where(student_id:@student.id).last
	end
	
end