class OrderProfile
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is invalid'}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
end