class Admin::InterviewScoresController < Admin::BaseController
  def index
	@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @interview_scores = InterviewScore.includes(:student).default_where(search_params).page(params[:page]).per(10)
  end

  def import_interview_score

  end

  def create_import_interview_score
    results = InterviewScore.import_data(params[:file],current_user)
    @import,@message = results[0],results[1]
	render "import_interview_score"
  end

  def export_interview_score
	xls_report = InterviewScore.export_data
    send_data xls_report, :type => 'text/xls', :filename => "#{InterviewScore.table_name}_#{Time.now.to_s(:db)}.xls"
  end
	
end