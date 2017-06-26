class UsersController < ApplicationController

  def new
    @is_using_email = true
    @user = User.new
  end

  def create
    @is_using_email = (params[:user] and !params[:user][:email].nil?)

    @user = User.new(params.require(:user)
      .permit(:email, :password, :password_confirmation, :cellphone, :token))
    @user.uuid = RandomCode.generate_utoken
    if @user.save
      UserMailer.activation_needed_email @user
      flash[:info] = "注册成功，请先激活"
      redirect_to new_session_path
    else
      render action: :new
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:info] = "激活成功，请登录"
      redirect_to new_session_path
    else
      not_authenticated
    end
  end
end