class Web::WrittenAppliesController < Web::BaseController
  before_action :left_tab, :only => [:index]
  before_action :set_written_apply, only: [:edit, :update]
  before_action :set_student

	def index
     session[:top_tab] = nil
     session[:top_tab_tipe] = "笔试辅导预约"
	   @written_applies = WrittenApply.preload(:student).default_where(student_id:@student.id)
     redirect_to :action=>"new" unless @written_applies.size>0
	end

	def new
    @written_apply = WrittenApply.new
	end

	def edit
     redirect_to root_path  if @written_apply.student_id != @student.id 
  end

  def create  
    @written_apply = WrittenApply.new(written_apply_params)
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
        if @written_apply.save
          redirect_to web_written_applies_url and return
        end
      end
    end
    render action: 'new'
  end


  def update
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
        if @written_apply.update(written_apply_params)
          redirect_to web_written_applies_url and return
        end
      end
    end
    render action: 'edit'  
  end

  private

  def can_written_apply?
    interview_score = @student.interview_score
    interview_score.present? && interview_score.status == "通过"
  end

  def is_limit_up? apply_set
    apply_set.limit_menber == WrittenApply.record_by_apply_set_id(apply_set.id).count && @written_apply.apply_set_id.to_s != written_apply_params[:apply_set_id].to_s
  end

  def set_written_apply
    @written_apply = WrittenApply.find(params[:id])
  end

  def set_student
    @student = current_user.student
  end

  def written_apply_params
    params.require(:written_apply).permit(:student_id,
                                     :apply_set_id,
                                     :name,
                                     :cat_no,
                                     :status)
  end

end