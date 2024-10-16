class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city_and_town, :number, :building_name, :tel, :user_id, :item_id

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city_and_town, presence: true,
                            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use full-width characters only' }
  validates :number, presence: true
  validates :tel, presence: true, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid.' }
  validates :user_id, numericality: { message: "can't be blank" }
  validates :item_id, numericality: { message: "can't be blank" }
  validates :token, presence: true

  def save
    purchase_record = PurchaseRecord.create(user_id:, item_id:)
    ShippingAddress.create(post_code:, prefecture_id:, city_and_town:, number:, tel:,
                           purchase_record_id: purchase_record.id)
  end
end

# このモデルは、mvcの流れで言うと、コントローラーとモデルの間に入るもの。
# このモデルから、各モデルに繋がり、各テーブルにデータを保存できる。
