class Admin::WrittenScoresController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @written_scores = WrittenScore.includes(:student).default_where(search_params).order(id:"desc").page(params[:page]).per(10)
	end

	def import_written_score

	end

	def create_import_written_score
	  @import = { failed: []}
    @message = {color:"#ff0000"}
    unless params[:file].blank?
      orig_name = params[:file].original_filename
      if ".XLSX" == File.extname(orig_name).upcase
        require 'roo'
        @students = []
        path = params[:file].tempfile.path
        workbook = Roo::Spreadsheet.open path
        worksheet = workbook.sheet(0)
        row_no = 1
        worksheet.each_row_streaming(offset: 1, pad_cells: true) do |row|
          row_no += 1
          next if row[0].blank?
          record = {excel_row: row_no, success: true}
          WrittenScore::SCORE_COLUMNS.each do |c,i|
            record[c] = row[i]&.value 
          end
          return_student, message = WrittenScore.save_from_hash(record, current_user)
          @students << return_student
          if return_student.blank?
            record[:success] = false
            record[:message] = message
            @import[:failed] << record 
          end
        end
        if @import == { failed: [] }
          @message[:color] = "#00DD00"
          @message[:detail] = "笔试成绩信息导入成功"
        end  
      else
        @message[:detail] = "文件格式要求为.xlsx格式。"
      end  
    else
      @message[:detail] = "请上传文件"
    end
    render "import_written_score"
  end

	def export_written_score
		search_date = Time.now
    file = Spreadsheet.open "#{Rails.root}/public/xls/interview_scores.xls"
    list = file.worksheet  0
    interview_scores = WrittenScore.all
    interview_scores.each_with_index do |written_score,index|
      list[index+1,0] = written_score.student&.mobile
      list[index+1,1] = written_score.student&.name
      list[index+1,2] = written_score.score.round(2)
      list[index+1,3] = written_score.score_order
    end
    xls_report = StringIO.new
    file.write xls_report
    send_data xls_report.string, :type => 'text/xls', :filename => "written_scores_#{search_date.to_s(:db)}.xls"
	end
end