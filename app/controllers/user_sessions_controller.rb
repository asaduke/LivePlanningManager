class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember])

    if @user
      flash[:success] = "ログインしました"
      redirect_back_or_to lives_path
    else
      flash.now[:error] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
