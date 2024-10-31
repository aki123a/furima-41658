class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if, only: [:index]

  def index
  
    @order_address = OrderAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?  # バリデーションを確認
      pay_item                 # 支払い処理を実行
      @order_address.save      # 保存処理を実行
      redirect_to root_path    # 保存が成功した場合のリダイレクト
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity  # エラー時の再描画
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :shipping_area_id, :city, :address_banti, :address_building, 
      :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,        # 商品価格
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 日本円
    )
  end

  def redirect_if
    @item = Item.find(params[:item_id]) 
    if @item.user_id == current_user.id || @item.sold_out?
      redirect_to root_path
    end
  end
end
