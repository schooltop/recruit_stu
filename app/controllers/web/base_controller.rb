class Web::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'bimba'
  before_action :authenticate_user!
  before_action :is_student!

  def is_student!
    current_user.is_student?
  end
  
end
