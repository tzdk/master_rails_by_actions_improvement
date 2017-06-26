class Admin::UsersController < Admin::BaseController

  def index
    @users = User.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end

  def update
    @user = User.find(params[:id])
    @user.is_admin = true
    if @user.save
      flash[:notice] = "修改成功"
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

end