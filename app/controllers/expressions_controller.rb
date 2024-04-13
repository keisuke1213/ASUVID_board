class ExpressionsController < ApplicationController
  def new
    @exp = Expression.new
  end

 def create
   @exp = current_user.expressions.new(expression_params)
   @exp.save
   redirect_to expressions_path
 end
  def index
    if params[:search]
      @exps = Expression.joins(:user).where("expressions.title LIKE ? OR users.name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
    @exps = Expression.all.order(created_at: :desc)
    end
  end

  def show
    @exp = Expression.find(params[:id])
    @user = @exp.user
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
    redirect_to expressions_path
  end
  
  private 
  
  def expression_params
    params.require(:expression).permit(:title, :content, :message, :exp_image)
  end
  
end
