class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("favorite_#{post.id}", partial: 'favorites/unfavorite', locals: { post: post }) }
      format.html { redirect_to @post }
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("favorite_#{post.id}", partial: 'favorites/favorite', locals: { post: post }) }
      format.html { redirect_to @post }
    end
  end
end
