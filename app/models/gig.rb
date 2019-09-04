class Gig < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :pricings
  has_many :orders

  has_many :buying_orders, foreign_key: "buyer_id", class_name: "Order"
  has_many :selling_orders, foreign_key: "seller_id", class_name: "Order"

  has_many_attached :photos
  has_rich_text :description
  

  accepts_nested_attributes_for :pricings

  validates :title, presence: {message: 'cannot be blank'}
end

