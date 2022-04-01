class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow_users = @user.follow_user
    @follower_users = @user.follower_user
  end

  def edit
  end

  def withdraw_confirm
  end
  
  def follows
    user = User.find(params[:id])
  end

  def followers
    user = User.find(params[:id])
  end
  
end
