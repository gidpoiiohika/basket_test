require 'rails_helper'

describe  LineItem do
  it "return the total price" do
    product = Product.create(price: 50, description: 'test1', name: 'item1test')

    item = LineItem.new(product_id: product.id, quantity: 2)
    expect(item.total_price).to eq(100)
  end
end
