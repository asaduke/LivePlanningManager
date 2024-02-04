class PackingItemsController < ApplicationController
  before_action :set_packing_item, only: %i[edit update destroy]

  def new
    @packing_item = Packing_item.new
  end

  def create
    @packing_item = current_user.packing_items.build(packing_item_params)
    @packing_item.save
  end

  def edit; end

  def update
    @packing_item.update(packing_item_params)
  end

  def destroy
    @packing_item.destroy!
  end

  private

  def packing_item_params
    params.require(:packing_item).permit(:name).merge(live_id: params[:live_id])
  end

  def set_packing_item
    @packing_item = current_user.packing_items.find(params[:id])
  end
end
