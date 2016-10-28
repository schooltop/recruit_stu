module Web
  class PasswordsController < Devise::PasswordsController
  	  skip_before_action :require_no_authentication, :only => [:edit, :update]
  	  skip_before_action :assert_reset_token_passed, :only => :edit

	  # GET /resource/password/edit?reset_password_token=abcdef
	  def edit
	    super
	  end

	  # PUT /resource/password
	  def update
	    # super
	  self.resource = resource_class.reset_password_by_token(resource_params)
	  yield resource if block_given?
	    if resource.errors.empty?
	      resource.unlock_access! if unlockable?(resource)
	      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
	      set_flash_message(:notice, flash_message) if is_flashing_format?
	      sign_in(resource_name, resource)
	      respond_with resource, location: after_resetting_password_path_for(resource)
	    else
	      respond_with resource
	    end
	  end

	  protected

	  def require_no_authentication
	    return super
	  end

	  def assert_reset_token_passed
	    if params[:reset_password_token].blank?
	        set_flash_message(:error, :no_token)
	        redirect_to new_session_path(resource_name)
	    end
	  end

	  def after_resetting_password_path_for(resource)
	    super(resource)
	  end

  end
end
