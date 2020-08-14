class UsersController < ApplicationController

  def index
    @posts = Post.includes(:images).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order('created_at DESC')
  end  

  def likes
    @posts = current_user.posts.order('created_at DESC')
  end
end

