class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :update]

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
    unless current_user == @item.user
      redirect_to  root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name,:explanation,:category_id,:condition_id,:shipping_fee_id,:shipping_area_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end
end

