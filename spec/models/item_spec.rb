require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品出品' do
    #  context '商品出品できる場合' do
    #   it 'nameとimageとexplanationとcondition_idとcategory_idとshipping_fee_idとprefecture_idとdelivery_time_idとpriceとuserが存在すれば登録できる' do
    #    expect(@item).to be_valid
    # end
    # end

    context '商品出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      # it 'imageが空では出品できない' do
      #  @item.image = ''
      # @item.valid?
      # expect(@item.errors.full_messages).to include("Image can't be blank")
      # end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      # it 'shipping_fee_idが1では出品できない' do
      #  @item.shipping_fee_id = 1
      # @item.valid?
      # expect(@item.errors.full_messages).to include("Shippingfee can't be blank")
      # end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      # it 'delivery_time_idが1では出品できない' do
      # @item.delivery_time_id = 1
      # @item.valid?
      # expect(@item.errors.full_messages).to include("Deliverytime can't be blank")
      #  end
    end
  end
end
