 class Order < ApplicationRecord
  attr_accessor :token
  has_one :address, dependent: :destroy
  belongs_to :user
  belongs_to :item

 end
