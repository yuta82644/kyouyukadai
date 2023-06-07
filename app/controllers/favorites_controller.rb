class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to favorites_path,
                notice: "#{favorite.picture.user.name}さんのブログをお気に入りしました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path,
                notice: "#{favorite.picture.user.name}さんのブログ解除しました"
  end

  def index
    # @favorites = favorite.all
    @favorites = current_user.favorites
  end
end
