class PostsController < ApplicationController
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
   @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def destroy
   post = Post.find(params[:id])
   post.destroy
   redirect_to posts_path
  end
  
  
   private
  
  def post_params
    params.require(:post).permit(:type, :title, :date, :image,:content,:deadline,:number,:URL,:start_time)
    
  end
  
end
