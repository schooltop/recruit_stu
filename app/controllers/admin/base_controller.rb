class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin'
  before_action :authenticate_user!
  before_action :is_worke!

  def is_worke!
    current_user.is_worke?
  end

end
