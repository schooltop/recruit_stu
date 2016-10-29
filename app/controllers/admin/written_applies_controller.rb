class Admin::WrittenAppliesController < Admin::BaseController
	before_action :set_written_apply, only: [:edit, :update]
  before_action :set_student,:except=>["index","export_written_apply"]
	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @written_applies = WrittenApply.includes(:apply_set,:student).default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @written_apply = WrittenApply.new
  end

  def create  
    @written_apply = WrittenApply.new(written_apply_params)
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @written_apply.errors.add(:msg, "请选择笔试辅导时间段")
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if !can_written_apply?
          @written_apply.errors.add(:msg, "您的面试信息正在审验,不能预约笔试。")
        elsif apply_set.limit_menber == WrittenApply.record_by_apply_set_id(apply_set.id).count
          apply_set.update(status: 0)
          @written_apply.errors.add(:msg, "该时间段预约人数已超过上限，请选择其他时间段")
        else
           @written_apply.save
        end
      end
      format.js
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @written_apply.errors.add(:msg, "请选择笔试辅导时间段")
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if !can_written_apply?
          @written_apply.errors.add(:msg, "您的面试信息正在审验,不能预约笔试。")
        elsif is_limit_up?(apply_set) 
          apply_set.update(status: 0)
          @written_apply.errors.add(:msg, "该时间段预约人数已超过上限，请选择其他时间段")
        else
          @written_apply.update(written_apply_params)
        end
      end
      format.js
    end   
  end

  def export_written_apply
    search_date = Time.now
    file = Spreadsheet.open "#{Rails.root}/public/xls/written_applies.xls"
    list = file.worksheet  0
    written_apply = WrittenApply.all
    written_apply.each_with_index do |written_apply,index|
      list[index+1,0] = written_apply.student&.name
      list[index+1,1] = written_apply.student&.mobile
      list[index+1,2] = written_apply.apply_set&.comment
      list[index+1,3] = written_apply.cat_no
      list[index+1,4] = written_apply.status
    end
    xls_report = StringIO.new
    file.write xls_report
    send_data xls_report.string, :type => 'text/xls', :filename => "written_applies_#{search_date.to_s(:db)}.xls"
  end
	
	private

  def can_written_apply?
    interview_score = @current_student.interview_score
    interview_score.present? && interview_score.status == "通过"
  end

  def set_student
    @current_student = @written_apply.student
  end

	def set_written_apply
		@written_apply = WrittenApply.find(params[:id])
  end

  def written_apply_params
    params.require(:written_apply).permit(:student_id,
                                     :apply_set_id,
                                     :name,
                                     :cat_no,
                                     :status)
  end

  def is_limit_up? apply_set
    apply_set.limit_menber == WrittenApply.record_by_apply_set_id(apply_set.id).count && @written_apply.apply_set_id.to_s != written_apply_params[:apply_set_id].to_s
  end
  
end