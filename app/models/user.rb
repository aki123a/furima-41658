class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders

         validates :name,                     presence: true
         validates :password,                 format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
         validates :name_kanji_firstname,     presence: true, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
         validates :name_kanji_lastname,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :name_kana_firstname,      presence: true, format: { with: /\A[ァ-ヶー]+\z/ } 
         validates :name_kana_lastname,       presence: true, format: { with: /\A[ァ-ヶー]+\z/ }     
         validates :birthday,                 presence: true     
end
