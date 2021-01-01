class ItemsController < ApplicationController
  def index
  end

  def new
    @item  = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      @item = Item.new(item_params)
      @item.valid?
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:itemname,:iteminfo,:price,:category_id,:image).merge(user_id: current_user.id)
  end
end
