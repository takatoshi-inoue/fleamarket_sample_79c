class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @images = @post.images
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name ,:text, :condition, :burden, :area, :day, :price, :brand, images_attributes: [:name]).merge(user_id: current_user.id)
  end
end

