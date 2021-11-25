class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true
end
