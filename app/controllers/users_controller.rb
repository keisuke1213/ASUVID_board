class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update,:destroy]
  
  def index
    if params[:search]
      @users = User.where("name LIKE ? OR grade LIKE ? or line_name LIKE ? or segment = ? or section = ? or college LIKE ? or furigana LIKE ?",
      "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", params[:search], params[:search], "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @users = User.all.page(params[:page]).order(grade: :desc)
    end
  end

  def show
    @user = User.find(params[:id])
    @exps = @user.expressions.page(params[:page]).order(created_at: :desc)
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
    render edit_user_path(@user.id)
    end
  end
  
  def destroy
    is_matching_login_user
    user = User.find(params[:id])
    if user.destroy
    redirect_to users_path
    else
    render users_path
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :grade, :line_name, :segment, :section,:college,:furigana)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end
  
end

