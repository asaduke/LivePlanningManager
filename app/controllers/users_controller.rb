class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "新規登録に成功しました"
      session[:user_id] = @user.id
      redirect_to lives_path
    else
      flash.now[:error] = "新規登録できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
