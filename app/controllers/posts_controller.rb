class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def show

    @post = Post.find(params[:id])
    @user = @post.user
    @images =@post.images
  end

  def create
    @post=Post.new(post_params)
  end

end

