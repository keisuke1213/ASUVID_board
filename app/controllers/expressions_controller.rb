class ExpressionsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @exp = Expression.new
  end

 def create
   @post = Post.find(params[:post_id])
   @exp = current_user.expressions.new(expression_params)
   @exp.post_id = @post.id
   @exp.save
   redirect_to post_path(@post)
 end
  def index
    @post = Post.find(params[:post_id])
  end

  def show
    @exp = Expression.find(params[:id])
  end

  def edit
    @exp = Expression.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @exp = Expression.find(params[:id])
    @exp.update(expression_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    exp =  Expression.find(params[:id])
    exp.destroy
    redirect_to post_expressions_path
  end
  
  private 
  
  def expression_params
    params.require(:expression).permit(:title, :content, :message)
  end
  
end
