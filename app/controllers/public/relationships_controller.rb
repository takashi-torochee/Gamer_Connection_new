class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # フォロー
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  
  # フォロー外す
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

end
