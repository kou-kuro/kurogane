class FavoritesController < ApplicationController
  # def create
  #   Favorite.create(user_id: current_user.id, article_id: params[:id])
  #   # redirect_back(fallback_location: articles_path)

  # end
  
  # def destroy
  #   Favorite.find_by(user_id: current_user.id, article_id: params[:id]).destroy
  #   # redirect_back(fallback_location: articles_path)
  # end
  before_action :set_post

 

  def create
 
  @favorite = current_user.favorites.new(article_id: @article.id)
 
  @favorite.save
 
  @favorite = Favorite.where(article_id: @article.id)
  end
 
 
 
  def destroy
 
  @favorite = Favorite.find_by(article_id: @article.id, user_id: current_user.id).destroy
 
  @favorite = Favorite.where(article_id: @article.id)
 
  end
 
 
 
  private
 
  def set_post
 
  @article = Article.find(params[:article_id])
 
  end
 
end
