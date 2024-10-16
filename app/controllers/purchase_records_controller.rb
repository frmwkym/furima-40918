class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.purchase_record.present?
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city_and_town, :number, :building_name, :tel, :price).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
