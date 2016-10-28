class DashboardController < ApplicationController
  def index
  	if current_user.is_worker? && false
  	  @worker = true	
      render :layout => "admin"
  	else
  	  @worker = false	
  	  @student = current_user.student
      render :layout => "bimba"
  	end
  end
end
