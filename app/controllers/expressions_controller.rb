class ExpressionsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update,:destroy]
  
  def new
    @exp = Expression.new
  end

 def create
   @exp = current_user.expressions.new(expression_params)
  if  @exp.save
    flash[:notice] = "登録に成功しました。"
   redirect_to expressions_path
  else
    render :new
  end
 end
  def index
    if params[:search]
      @exps = Expression.joins(:user).where("expressions.title LIKE ? OR users.name LIKE ? OR expressions.type LIKE?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page])
    else
    @exps = Expression.all.page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @exp = Expression.find(params[:id])
    @user = @exp.user
  end

  def edit
    is_matching_login_user
    @exp = Expression.find(params[:id])
    
  end
  
  def update
    is_matching_login_user
    @exp = Expression.find(params[:id])
    if @exp.update(expression_params)
    flash[:notice] = "情報が更新されました。"
    redirect_to expressions_path
    else
      render :edit
    end
  end
  
  def destroy
    is_matching_login_user
    exp =  Expression.find(params[:id])
    exp.destroy
    redirect_to expressions_path
  end
  
  private 
  
  def expression_params
    params.require(:expression).permit(:title, :content, :message, :exp_image,:type)
  end
  
  def is_matching_login_user
    @exp = Expression.find(params[:id])
    user = @exp.user
    unless user.id == current_user.id
      redirect_to expression_path(@exp.id)
    end
  end
  
  
end
