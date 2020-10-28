class FavoritesController < ApplicationController

  def create
    @favorite = favorite.new
    @favorite.user_id = current.user_id
    @favorite.article_id = params[:article_id]

    if @favorite.save
        redirect_to article_path, success: 'お気に入りができました'
    else
        redirect_to article_path, danger: 'お気に入りができませんでした'
    end

end
