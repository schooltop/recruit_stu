class Web::WrittenAppliesController < Web::BaseController

	def index
	   @student = current_user.student
	   @written_apply = WrittenApply.default_where(student_id:@student.id).last
	end

	def new

	end

	def edit

    end

    def create
    	
    end

    def update

    end

end