class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy

  def add_product(product)
    current_item = cart_products.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_products.build(product_id: product.id)
      current_item.price = current_item.product.price
    end
    current_item
  end

  def total_price
    cart_products.to_a.sum { |item| item.total_price }
  end
end
