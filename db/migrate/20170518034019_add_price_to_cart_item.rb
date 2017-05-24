class AddPriceToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_products, :price, :interger
    CartProduct.all.each do |cp|
      cp.price = cp.product.price
    end
  end
end
