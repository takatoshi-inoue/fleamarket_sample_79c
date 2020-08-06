class PostsController < ApplicationController
  before_action :set_parents, only: [:new, :create]

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

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def search
    #ajax通信を開始
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end


  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @images = @post.images
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name ,:text, :condition, :burden, :category_id, :area, :day, :price, :brand, images_attributes: [:name]).merge(user_id: current_user.id)
  end
end

