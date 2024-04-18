class FavoritesController < ApplicationController
  def create
    exp = Expression.find(params[:expression_id])
    favorite = current_user.favorites.new(expression_id: exp.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    exp = Expression.find(params[:expression_id])
    favorite = current_user.favorites.find_by(expression_id: exp.id)
    favorite.destroy
    redirect_to  request.referer
end
end
