class ProductsController < ApplicationController

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    #redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    cart_item.destroy

    #redirect_back(fallback_location: root_path)
  end

  def adjust_item
    @product = Product.find(prams[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    if params[:type] == "add"
      cart_item.quantity += 1
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    end

    if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.destroy
    end

    #redirect_back(fallback_location: root_path)
  end

  def index
    @products = Product.all
  end

end
