class Admin::WrittenAppliesController < Admin::BaseController
	before_action :set_written_apply, only: [:edit, :update]
	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @written_applies = WrittenApply.preload(:student).default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @written_apply = WrittenApply.new
    @current_student = Student.first
  end

  def create  
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @error_message = "请选择笔试辅导时间段"
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if apply_set.limit_menber == WrittenApply.record_by_apply_set_id(apply_set.id).count
          apply_set.update(status: 0)
          @error_message = "笔试辅导人数已超过上线"
        else
          @written_apply = WrittenApply.create(written_apply_params)
        end
      end
      format.js
    end
  end

  def edit
    @current_student = Student.first
  end

  def update
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @error_message = "请选择笔试辅导时间段"
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if apply_set.limit_menber == WrittenApply.record_by_apply_set_id(apply_set.id).count
          apply_set.update(status: 0)
          @error_message = "笔试辅导人数已超过上线"
        else
          @written_apply.update(written_apply_params)
        end
      end
      format.js
    end   
  end
	
	private

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
end