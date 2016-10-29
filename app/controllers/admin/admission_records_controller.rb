class Admin::AdmissionRecordsController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @admission_records = AdmissionRecord.includes(:student).default_where(search_params).page(params[:page]).per(10)
	end

	def import_admission_record

	end

	def create_import_admission_record

    end

	def export_admission_record

	end
	
end