class FavoritesController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    favorite = @micropost.favorites.new(user_id: current_user.id)
    favorite.save
    flash[:success] = 'お気に入りに追加しました'
    redirect_to micropost
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    favorite = current_user.favorites.find_by(post_id: @micropost.id)
    favorite.destroy
    flash[:success] = 'お気に入りを解除しました'
    redirect_to micropost
  end
end
