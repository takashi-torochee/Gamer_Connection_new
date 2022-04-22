class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @follow_users = @user.follow_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to users_show_path(@user)
      end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_show_path(@user.id)  
  end
  

  def withdraw_confirm
  end
  
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  def follows
    user = User.find(params[:id])
  end

  def followers
    user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile, :name, :email, :age, :game_title, :play_time)
  end
  
end
