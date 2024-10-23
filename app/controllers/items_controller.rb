class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

  def index
    @items =Item.includes( :user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name,:explanation,:category_id,:condition_id,:shipping_fee_id,:shipping_area_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end
end

