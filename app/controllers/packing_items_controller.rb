class PackingItemsController < ApplicationController
  before_action :set_live

  def create
    @packing_item = @live.packing_items.build(packing_item_params)
    @packing_item.user = current_user

    respond_to do |format|
      if @packing_item.save
        format.html { redirect_to @live }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @packing_item = current_user.packing_items.find(params[:id])
    @packing_item.destroy!
  end

  private

  def packing_item_params
    params.require(:packing_item).permit(:name)
  end

  def set_live
    @live = Live.find_by(id: params[:live_id] || params[:life_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to lives_path, alert: '見つかりませんでした'
  end
end
