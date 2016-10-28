class Web::StudentsController < Web::BaseController
  before_filter :top_tab, :only => [:user_edit_self,:porsonal_inf]
  before_filter :left_tab, :only => [:user_edit_self,:porsonal_inf]
  before_filter :minit_tab, :only => [:user_edit_self,:porsonal_inf]

  def porsonal_inf
  	session[:top_tab_tipe] = "个人信息"
    @student = current_user.student
  end

  def user_edit_self
    @user = current_user
  end
  
  def update_password
    if params[:user][:id].to_i == current_user.id
      if params[:user][:password]==params[:user][:password_confirmation]
        @user=User.find(params[:user][:id])
        @user.password = params[:user][:password]
        @user.save
        flash[:notice] = "用户信息修改成功"
        redirect_to :action=>"user_edit_self"
      else
        flash[:rolse_notice] = "两次输入的密码不一致，请重新填写！"
        redirect_to :action=>"user_edit_self"
      end
    else
      flash[:notice] = "用户只能修改自己的登录密码"
      redirect_to :action=>"user_edit_self"
    end  
  end

end