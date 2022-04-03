class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"
  def show
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_homes_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:is_active)
  end
  
end
