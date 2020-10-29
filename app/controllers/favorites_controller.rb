class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, article_id: params[:id])
    redirect_to articles_path
  end
  
  def destroy
    Favorite.find_by(user_id: current_user.id, article_id: params[:id]).destroy
    redirect_to articles_path
  end
end
