class LivesController < ApplicationController
  before_action :set_live, only: %i[show edit update destroy]

  def index
    @q = current_user.lives.ransack(params[:q])
    @lives = @q.result(distinct: true).includes(:user).order(departure_time: :desc)
  end

  def new
    @live = Live.new
  end

  def edit; end

  def create
    @live = current_user.lives.build(live_params)

    if @live.save
      flash[:success] = "作成しました"
      redirect_to @live
    else
      flash.now[:error] = "作成できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @live = Live.find(params[:id])
    @packing_item = PackingItem.new
    @packing_items = @live.packing_items.includes(:user).order(:id)
  end

  def update
    if @live.update(live_params)
      redirect_to @live
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @live.destroy
      redirect_to lives_path, flash: { success: "削除しました" }, status: :see_other
    else
      flash.now[:error] = "削除できませんでした"
      render :show
    end
  end

  private

  def live_params
    params.require(:live).permit(:title, :place, :date, :open_time, :start_time, :departure_time)
  end

  def set_live
    @live = current_user.lives.find_by(id: params[:id])

    if @live.nil?
      flash[:error] = "指定されたライブは存在しません"
      redirect_to lives_path
    end
  end
end
