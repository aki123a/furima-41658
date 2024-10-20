class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  validates :title, :text, presence: true
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" } 
end
