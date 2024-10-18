class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name,        presence: true
         validates :email,     presence: true , format: { with: URI::MailTo::EMAIL_REGEXP}
         validates :password,  presence: true,  length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
         validates :password_confirmation,    presence: true     
         validates :password, confirmation: { case_sensitive: true}
         validates :name_kanji_firstname,        presence: true, format:  { with: /\A[ぁ-ん一-龥々]+\z/} 
         validates :name_kanji_lastname,     presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/}
         validates :name_kana_firstname,  presence: true, format: { with: /\A[ァ-ン]+\z/ } 
         validates :name_kana_lastname,    presence: true, format: { with: /\A[ァ-ン]+\z/ }     
         validates :birthday,    presence: true     
end
