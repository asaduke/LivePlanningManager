class LivesController < ApplicationController
  before_action :set_live, only: %i[edit update destroy]

  def index
    @lives = Live.all.order(date: :desc)
  end

  def new
    @live = Live.new
  end

  def edit; end

  def create
    @live = current_user.lives.build(live_params)

    if @live.save
      flash[:success] = "作成しました"
      redirect_to lives_path
    else
      flash.now[:error] = "作成できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @live = Live.find(params[:id])
  end

  def update
    if @live.update(live_params)
      flash[:success] = "更新しました"
      redirect_to @live
    else
      flash.now[:error] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @live.destroy!
    flash[:success] = "削除しました"
    redirect_to lives_path, status: :see_other
  end

  private

  def live_params
    params.require(:live).permit(:title, :place, :date, :open_time, :start_time, :departure_time)
  end

  def set_live
    @live = current_user.lives.find(params[:id])
  end
end
