class PostsController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update,:destroy]
  
  def new
    @new_post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    if params[:search]
      @posts = Post.where("title LIKE ? OR type LIKE?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @posts = Post.all
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
   @post = Post.find(params[:id])
   @exp = Expression.new
  end

  def edit
    is_matching_login_user
   @post = Post.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    is_matching_login_user
   post = Post.find(params[:id])
   post.destroy
   redirect_to posts_path
  end
  
  
   private
  
  def post_params
    params.require(:post).permit(:type, :title, :date, :image,:content,:deadline,:number,:URL,:start_time,:approximate_date,:date_decided ,:belongings,:place)
  end
  
  def is_matching_login_user
    @post = Post.find(params[:id])
    user = @post.user
    unless user.id == current_user.id
      redirect_to post_path(@post.id)
    end
  end
  
end
