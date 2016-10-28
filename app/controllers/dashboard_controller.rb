class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	if 1 == 1#current_user.is_worker? && false
  	  @worker = true	
      render :layout => "admin"
  	else
  	  @worker = false	
  	  @student = current_user.student
      render :layout => "bimba"
  	end
  end
end
