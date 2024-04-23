class PostsController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update,:destroy]
  
  def new
    @new_post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.clear_start_time_if_date_undecided 
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "登録に成功しました。"
      redirect_to posts_path
    else 
      render :new 
    end
  end

  def index
    if params[:search]
      @posts = Post.where("title LIKE ? OR type LIKE?", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page])
    else
      @posts = Post.all.page(params[:page]).order(created_at: :desc)
    end
  end

  def show
   @post = Post.find(params[:id])
  end

  def edit
    is_matching_login_user
   @post = Post.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "情報が更新されました。"
    redirect_to post_path(@post.id)
    else
      render :edit
    end
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
