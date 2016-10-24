class Admin::usersController < Admin::BaseController

	before_action :set_employee, only: [:edit, :update, :roles, :update_roles, :edit_parent, :update_parent]

  def index
    @q = SearchParams.new(params[:search_params] || {})
    search_params = @q.attributes(self)
    @user = User.default_where(search_params).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
  end

  def update
    filter_params = user_params
    filter_params.except!(:password, :password_confirmation) if filter_params[:password].blank? && filter_params[:password_confirmation].blank?
    @user.update(filter_params)
  end

	private

	def set_user
		@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                     :email,
                                     :password,
                                     :password_confirmation,
                                     :mobile,
                                     :telephone)
  end

end
