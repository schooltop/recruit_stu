class Admin::WrittenAppliesController < Admin::BaseController
	before_action :set_written_apply, only: [:edit, :update]
	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @written_applies = WrittenApply.default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @written_apply = WrittenApply.new
    @current_student = Student.first
  end

  def create
    @written_apply = WrittenApply.create(written_apply_params)
  end

  def edit
  end

  def update
    @written_apply.update(written_apply_params)
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