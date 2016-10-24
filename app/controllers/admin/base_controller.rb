class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin'
  before_action :authenticate_user!

end
