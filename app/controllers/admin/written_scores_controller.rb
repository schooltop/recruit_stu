class Admin::WrittenScoresController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @written_scores = WrittenScore.default_where(search_params).order(id:"desc").page(params[:page]).per(10)
	end

	def import_written_score

	end

	def create_import_written_score

    end

	def export_written_score

	end
end