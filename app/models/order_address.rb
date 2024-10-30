class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address_banti, :address_building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address_banti
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code, 
      shipping_area_id: shipping_area_id, 
      city: city, 
      address_banti: address_banti, 
      address_building: address_building, 
      phone_number: phone_number, 
      order_id: order.id
    )
  end
end