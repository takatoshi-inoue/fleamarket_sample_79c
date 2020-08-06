class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :item_sold?, only: [:show]

  def index
    @posts = Post.includes(:images).order('created_at DESC')
    
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_sold?
    redirect_to action: :index if Post.find(params[:id]).brand == "b"
  end

end

