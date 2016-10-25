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