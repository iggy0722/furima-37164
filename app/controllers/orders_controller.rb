class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :item_soldout
  before_action :item_empty

  def index
    @order_profile = OrderProfile.new
  end

  def create
    @order_profile = OrderProfile.new(order_params)
    if @order_profile.valid?
      pay_item
      @order_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_profile).permit(:postal, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_profile.token,
      currency: 'jpy'
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def item_soldout
    redirect_to root_path if @item.user.id == current_user.id
  end

  def item_empty
      redirect_to root_path if @item.order
  end
end
