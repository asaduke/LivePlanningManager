class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path) }
      format.js
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path) }
      format.js
    end
  end
end
