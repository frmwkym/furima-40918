class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :shipping_addresses

  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use full-width characters only' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use full-width characters only' }
  validates :last_name_phonetic_spelling, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Please use only katakana' }
  validates :first_name_phonetic_spelling, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Please use only katakana' }
  validates :date_of_birth, presence: true
end
