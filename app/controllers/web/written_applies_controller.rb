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

  end

  def create  
    @written_apply = WrittenApply.new(written_apply_params)
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @written_apply.errors[:msg] = "请选择笔试辅导时间段"
        format.html {render :new}
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if apply_set.limit_menber <= WrittenApply.record_by_apply_set_id(apply_set.id).count
          apply_set.update(status: 0)
          @written_apply.errors[:msg] = "笔试辅导人数已超过上线"
          format.html {render :new}
        elsif @student.written_apply
          @written_apply.errors[:msg] = "已存在申请记录"
          format.html {render :new}
        else 
          if @written_apply.save
            format.html {redirect_to web_written_applies_url, notice: '创建成功.'}
          end
        end
      end
    end
  end

  def update
    respond_to do |format|
      if written_apply_params[:apply_set_id].blank?
        @written_apply.errors[:msg] = "请选择笔试辅导时间段"
        format.html { render :edit }
      else
        apply_set = ApplySet.find(written_apply_params[:apply_set_id])
        if apply_set.limit_menber <= WrittenApply.record_by_apply_set_id(apply_set.id).count
          apply_set.update(status: 0)
          @written_apply.errors[:msg] = "笔试辅导人数已超过上线"
          format.html { render :edit }
        else
         if @written_apply.update(written_apply_params)
           format.html {redirect_to web_written_applies_url, notice: '更新成功.'}
         end
        end
      end
    end   
  end

  private

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