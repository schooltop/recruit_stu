class Admin::AdmissionRecordsController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @admission_records = AdmissionRecord.default_where(search_params).page(params[:page]).per(10)
	end
	
end