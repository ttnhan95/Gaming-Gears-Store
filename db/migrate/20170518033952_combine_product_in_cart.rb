class CombineProductInCart < ActiveRecord::Migration[5.0]
  def up
    # replace multiple items for a single product in a cart with a
    # single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.cart_products.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.cart_products.where(product_id: product_id).delete_all

          # replace with a single item
          item = cart.cart_products.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    CartProduct.where("quantity>1").each do |cart_product|
      # add individual items
      CartProduct.quantity.times do
        CartProduct.create(
            cart_id: cart_product.cart_id,
            product_id: cart_product.product_id,
            quantity: 1
        )
      end

      # remove original item
      cart_product.destroy
    end
  end
end
