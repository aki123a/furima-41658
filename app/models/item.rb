class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :delivery_day


  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :delivery_day_id, numericality: { other_than: 0, message: "can't be blank" } 
end
