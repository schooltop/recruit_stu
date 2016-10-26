class Admin::ApplySetsController < Admin::BaseController
	before_action :set_apply, only: [:edit, :update]

	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @apply_sets = ApplySet.default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @apply_set = ApplySet.new
  end

  def create
    @apply_set = ApplySet.create(apply_set_params)
  end

  def edit
  end

  def update
    @apply_set.update(apply_set_params)
  end
	
	private

	def set_apply
		@apply_set = ApplySet.find(params[:id])
  end

  def apply_set_params
    params.require(:apply_set).permit(:student_class_id,
                                     :apply_at,
                                     :place_where,
                                     :comment,
                                     :limit_menber,
                                     :status,
                                     :show_at)
  end
end