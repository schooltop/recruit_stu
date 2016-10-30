class Admin::WrittenScoresController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @written_scores = WrittenScore.includes(:student).default_where(search_params).order(id:"desc").page(params[:page]).per(10)
	end

	def import_written_score

	end


	def create_import_written_score
    results = WrittenScore.import_data(params[:file],current_user)
    @import,@message = results[0],results[1]
    render "import_written_score"
  end

	def export_written_score
    xls_report = WrittenScore.export_data
    send_data xls_report, :type => 'text/xls', :filename => "#{WrittenScore.table_name}_#{Time.now.to_s(:db)}.xls"
	end
end