class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_find, only:[:edit, :update]

  def index
    @items = Item.includes(:user)
    @orders = Order.includes(:item)
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
  
  def show   
    @item = Item.find(params[:id])
    @orders = Order.includes(:item)
    # binding.pry
  end
  
  def edit   
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      @item.valid?
      render 'edit'
    end     
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  
  private
  def item_params
    params.require(:item).permit(:itemname,
      :iteminfo,
      :price,
      :category_id,
      :itemstatus_id,
      :feestatus_id,
      :prefecture_id,
      :delivery_id,
      :image)
      .merge(user_id: current_user.id)
    end
    
    def set_find
      @item = Item.find(params[:id])
  end
end
