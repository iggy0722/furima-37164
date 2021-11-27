class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :item_set, only: [:show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def item_set
    @item = Item.find(params[:id])
  end
end
