module Web
  class SessionsController < Devise::SessionsController
    # 前台登录界面
    def new
      super
    end

    # 登录行为
    def create
      resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource) if resource.is_active?
      respond_to do |format|
        current_user.add_log("#{current_user.email} Login At #{Time.now.format_date(:full)}",request.ip)
        format.html { redirect_to after_sign_in_path_for(resource) }
        format.json { render status: '201', json: resource.as_json(only: [:login, :email, :private_token]) }
      end
    end

    # 登出
    def destroy
      current_user.add_log("#{current_user.email} Sign out #{Time.now.format_date(:full)}",request.ip)
      super
    end

    def authenticate

    end

  end
end
