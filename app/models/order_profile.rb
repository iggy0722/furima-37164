class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number, length: { in: 10..11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Profile.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
