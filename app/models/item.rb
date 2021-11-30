class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  validates :image, presence: true
end
