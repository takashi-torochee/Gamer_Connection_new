class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.search(params[:search])
  end
end
