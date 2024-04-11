class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @posts = Post.all.includes(:user).order(departure_time: :desc)
  end

  def new
    @post = Post.new
    @live = Live.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:comment, :is_anonymous)
  end
end
