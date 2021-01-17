class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyinfo = Buyinfo.new
  end

  def create
    @buyinfo = Buyinfo.new(buyinfo_params)
    @item = Item.find(params[:item_id])
    if @buyinfo.valid?
        pay_item
        @buyinfo.save
        redirect_to root_path
      else
        render action: :index
    end
  end

  private 
  def buyinfo_params
    params.require(:buyinfo).permit(
      :postcode,
      :prefecture,
      :city,
      :street,
      :building,
      :tel)
      .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buyinfo_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
