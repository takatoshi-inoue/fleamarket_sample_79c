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
    if post.destroy
      redirect_to root_path
    else
      render :show
    end  
  end

  def edit
    @post = Post.find(params[:id])
    @post.images.new
    # @post = Post.new
    # @post.images.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path  
    else
      render :edit
    end
  end  
  
  private
  
  def post_params
    params.require(:post).permit(:name ,:text, :condition, :burden, :area, :day, :price, :brand, images_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end
end

