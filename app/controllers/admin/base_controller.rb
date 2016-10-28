class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin'
  before_action :authenticate_user!
  before_action :is_worker!

  def is_worker!
    redirect_to root_path unless current_user.is_worker?
  end

end
