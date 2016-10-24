# coding: utf-8
module Web
  class RegistrationsController < Devise::RegistrationsController

    # 注册用户的时候会要求填写具体的公司信息
    before_action :ensure_company, only: [:create]

    def new
      @user = User.new
      super
    end

    def create

      if User.find_by(email: user_params[:email])
        redirect_to new_user_registration_url(user_params.merge({company_name: company_params[:name]}).merge({error: '*Email existed'})) and return
      end
      @user = @company.users.build(user_params)
      if @user.save
        redirect_to :back
        sign_in(@user)
      else
        render :new
      end
    end

    private

    def ensure_company
      @company = Company.find_or_create_by!(company_params)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :mobile)
    end

    def company_params
      params.require(:company).permit(:name)
    end
  end
end
