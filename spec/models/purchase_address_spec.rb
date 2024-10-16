require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'post_codeとprefecture_idとcity_and_townとnumberとbuilding_nameとtelとpurchase_recordとitemとuserが存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city_and_townが空では購入できない' do
        @purchase_address.city_and_town = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City and town can't be blank")
      end
      it 'numberが空では購入できない' do
        @purchase_address.number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'telが空では購入できない' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
