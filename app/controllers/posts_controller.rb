class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_live, only: %i[new create destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @posts = Post.all
    @profiles = @posts.map { |post| post.user.profile }
  end

  def new
    if @live
      @packing_items = @live.packing_items.includes(:user).order(:id)
      @post = Post.new
    else
      redirect_to lives_path
    end
  end

  def create
    @post = @live.build_post(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "投稿しました"
      redirect_to posts_path
    else
      flash.now[:error] = "投稿できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @profile = @post.user.profile
    @live = @post.live
    @packing_items = @live.packing_items.includes(:user).order(:id)
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { success: "削除しました" }, status: :see_other
    else
      flash.now[:error] = "削除できませんでした"
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :is_anonymous)
  end

  def set_live
    @live = Live.find(params[:life_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
