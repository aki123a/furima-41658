class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :delivery_day
  has_one :order
  has_one_attached :image 

   def sold_out?
     order.present?
   end


  validates :image, presence:true
  validates :item_name,  presence: true
  validates :explanation,  presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
