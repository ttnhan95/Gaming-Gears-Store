require 'active_model/serializers/xml'
class Order < ApplicationRecord
  include ActiveModel::Serializers::Xml
  enum payment_method: {
      "Check"          => 0,
      "Credit card"    => 1,
      "Purchase order" => 2
  }
  has_many :cart_products, dependent: :destroy
  # ...
  validates :name, :address, :email, presence: true
  validates :payment_method, inclusion: payment_methods.keys
  def add_cart_products_from_cart(cart)
    cart.cart_products.each do |item|
      item.cart_id = nil
      cart_products << item
    end
  end
end