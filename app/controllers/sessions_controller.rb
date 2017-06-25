class SessionsController < ApplicationController

  def new

  end

  def create
    if user = User.find_by_email(params[:email])
      if user.activation_state != 'active'
        flash[:warning] = "用户没有激活，不能登录"
        redirect_to new_session_path
      elsif user = login(params[:email], params[:password])
        update_browser_uuid user.uuid

        flash[:info] = "登陆成功"
        redirect_to root_path
      else
        flash[:info] = "邮箱或者密码不正确"
        redirect_to new_session_path
      end
    else
      flash[:danger] = "用户不存在，请检查"
      redirect_to new_session_path
    end

  end

  def destroy
    logout
    cookies.delete :user_uuid
    flash[:notice] = "退出成功"
    redirect_to root_path
  end

end