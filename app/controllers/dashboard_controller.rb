class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	if current_user.is_worker? 
  	  @worker = true	
      render :layout => "admin"
  	else
  	  @worker = false	
  	  @student = current_user.student
      render :layout => "bimba"
  	end
  end
end
