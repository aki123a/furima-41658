class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :update]
    before_action :set_item, only: [:show,:edit,:update]
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
  end


  def edit
    unless current_user == @item.user
      redirect_to  root_path
    end
  end

  def update
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


  def set_item
    @item = Item.find(params[:id])
  end

end


