class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to @line_item.cart
    end
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
