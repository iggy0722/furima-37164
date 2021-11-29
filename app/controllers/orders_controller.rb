class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_profile = OrderProfile.new
  end

  def create
    @order_profile = OrderProfile.new.new(order_params)
    if @order_profile.valid?
      @order_profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_profile).permit(:postal, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
