class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = user.posts
    @user = user.id
    @name = user.nickname
  end  

  def likes
    user = current_user
    @posts = user.posts
  end
end
