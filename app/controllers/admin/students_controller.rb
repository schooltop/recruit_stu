class Admin::StudentsController < Admin::BaseController
	before_action :set_student, only: [:edit, :update]

	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @students = Student.default_where(search_params).page(params[:page]).per(10)
	end
	
	private

	def set_student
		@student = Student.find(params[:id])
  end

  def user_params
    params.require(:student).permit(:name)
  end
end