class PackingItemsController < ApplicationController
  before_action :set_live, only: %i[create update destroy toggle]

  def create
    @packing_item = @live.packing_items.build(packing_item_params)
    @packing_item.user = current_user

    respond_to do |format|
      if @packing_item.save
        @packing_items = @live.packing_items
        format.html { redirect_to @live }
        format.js
      else
        @packing_items = @live.packing_items
        format.html { render 'lives/show', status: :unprocessable_entity }
        format.js { render json: @packing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @packing_item = PackingItem.find(params[:id])

    if @packing_item.update(packing_item_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @packing_item = current_user.packing_items.find(params[:id])
    @packing_item.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@packing_item) }
      format.html { redirect_to packing_item_path(packing_item) }
    end
  end

  def toggle
    @packing_item = PackingItem.find(params[:id])
    @packing_item.update(is_checked: !@packing_item.is_checked)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@packing_item, partial: "packing_items/packing_item", locals: { packing_item: @packing_item })
      end
    end
  end

  private

  def packing_item_params
    params.require(:packing_item).permit(:name, :is_checked)
  end

  def set_live
    @live = Live.find_by(id: params[:live_id] || params[:life_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '見つかりませんでした'
    redirect_to lives_path
  end
end
