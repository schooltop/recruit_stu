class DashboardController < ApplicationController
  def index
  	if current_user.is_worker?
  	  @worker = true	
      layout 'admin'
  	else
  	  @worker = false	
  	  @student = current_user.student
      layout 'bimba'
  	end
  end
end
