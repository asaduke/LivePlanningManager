class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @posts = Post.all
    @profiles = @posts.map { |post| post.user.profile }
  end

  def new
    @live = current_user.lives.find(params[:life_id])

    if @live
      @packing_items = @live.packing_items.includes(:user).order(:id)
      @post = Post.new
    else
      redirect_to lives_path
    end
  end

  def create
    @live = current_user.lives.find(params[:life_id])

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
    @post = Post.find(params[:id])
    @profile = @post.user.profile
    @live = @post.live
    @packing_items = @live.packing_items.includes(:user).order(:id)
  end

  private

  def post_params
    params.require(:post).permit(:comment, :is_anonymous)
  end
end
