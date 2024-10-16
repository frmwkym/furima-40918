class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city_and_town, :number, :building_name, :tel, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_and_town, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use full-width characters only' }
    validates :number
    validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id, numericality: { message: "can't be blank" }
    validates :item_id, numericality: { message: "can't be blank" }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id:, item_id:)
    ShippingAddress.create(post_code:, prefecture_id:, city_and_town:, number:, tel:,
                           purchase_record_id: purchase_record.id)
  end
end
