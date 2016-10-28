class Admin::StudentsController < Admin::BaseController
	before_action :set_student, only: [:edit, :update]

	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @students = Student.default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
  end

  def edit
  end

  def update
    @student.update(student_params)
  end


  # 导入学生信息页面
  def import_student

  end


  # 解析保存价格
  def create_import_student
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
          Student::STUDENT_COLUMNS.each do |c,i|
            record[c] = row[i]&.value 
          end
          return_student, message = Student.save_from_hash(record, current_user)
          @students << return_student
          if return_student.blank?
            record[:success] = false
            record[:message] = message
            @import[:failed] << record 
          end
        end
        if @import == { failed: [] }
          @message[:color] = "#00DD00"
          @message[:detail] = "学生信息导入成功"
        end  
      else
        @message[:detail] = "文件格式要求为.xlsx格式。"
      end  
    else
      @message[:detail] = "请上传文件"
    end
    render "import_student"
  end


  # 导出学生信息
  def export_student
    search_date = Time.now
    file = Spreadsheet.open "#{Rails.root}/public/xls/students.xls"
    list = file.worksheet  0
    students = Student.all
    students.each_with_index do |student,index|
      list[index+1,0] = student.id
      list[index+1,1] = student.mobile
      list[index+1,2] = student.name
      list[index+1,3] = "身份证" #student.card_type
      list[index+1,4] = student.id_card
      list[index+1,5] = student.email
      list[index+1,6] = student.name_en
      list[index+1,7] = student.student_no
    end
    xls_report = StringIO.new
    file.write xls_report
    send_data xls_report.string, :type => 'text/xls', :filename => "students_#{search_date.to_s(:db)}.xls"
  end


	private

	def set_student
		@student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name,
                                     :email,
                                     :id_card,
                                     :student_no,
                                     :mobile,
                                     :telephone)
  end
end