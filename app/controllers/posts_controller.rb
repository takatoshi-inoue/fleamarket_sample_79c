class PostsController < ApplicationController
  def index
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
  
  private
  
  def post_params
    params.require(:post).permit(:name ,:text, :condition, :burden, :area, :day, :price, :brand, images_attributes: [:name]).merge(user_id: current_user.id)
  end

  def show
  end

end

