class Admin::StudentDocumentsController < Admin::BaseController
	before_action :set_student, only: [:edit, :update]

	def index
		@q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @students = StudentDocument.default_where(search_params).page(params[:page]).per(10)
	end

	def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    user = User.find_by(email: @student.email)
    if user.blank?
      user = User.new
      user.password =  @student.id_card.to_s.upcase
    end
    user.name = @student.name
    user.name_en = @student.name_en
    user.id_card = @student.id_card.to_s.upcase
    user.email = @student.email
    user.mobile = @student.mobile
    user.status = 1
    user.save
  end

  def edit
  end

  def update
    @student.update(student_params)
  end

  def delete

  end

  def test_student
    @q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @students = StudentDocument.default_where(search_params).page(params[:page]).per(10)
  end

	private

	def set_student
		@student = StudentDocument.find(params[:id])
  end

  def student_params
    params.require(:student_document).permit(:name,
                                     :email,
                                     :id_card,
                                     :student_no,
                                     :mobile,
                                     :telephone)
  end
end