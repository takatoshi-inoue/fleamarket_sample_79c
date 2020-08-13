class PostsController < ApplicationController
  before_action :set_parents, only: [:new, :create,:show, :edit]
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.includes(:images).order('created_at DESC')
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

  def search
    @posts = Post.search(params[:keyword])
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
    @user = User.find(@post.user_id)
    @images = @post.images
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @category = @post.category
    @like = Like.new
    @current_like = @post.likes.where(user_id: current_user.id).first
  end


  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    @post.images.new
  end

  def update
    if @post.update(post_params)
      redirect_to root_path  
    else
      render :edit
    end
  end  
  
  private
  
  def post_params
    params.require(:post).permit(:name ,:text, :condition, :burden, :category_id, :area, :day, :price, :brand, images_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def set_post
    @post = Post.find(params[:id])
  end 
end

