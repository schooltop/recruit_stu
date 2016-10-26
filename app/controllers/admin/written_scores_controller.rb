class Admin::WrittenScoresController < Admin::BaseController

	def index
		@q = SearchParams.new(params[:search_params] || {})
	    search_params = @q.attributes(self)
	    @written_scores = WrittenScore.default_where(search_params).page(params[:page]).per(10)
	end
end