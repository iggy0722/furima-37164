class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
end