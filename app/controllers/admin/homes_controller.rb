class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"
  def top
    @users = User.all.search(params[:search])
  end
end
