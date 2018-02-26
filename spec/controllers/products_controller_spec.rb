require 'rails_helper'

RSpec. describe ProductsController, type: :controller do

  describe "create action" do
    it "redirect to products list if product save" do
      post :create, params: { product: { name: 'Item', description: 'Test Item1', price: '50' }}
      expect redirect_to(@product)
    end

    it "renders new phe again if product not save" do
      post :create, params: { product: { name: nil, description: 'Test Item1', price: '100' }}
      expect render_template('new')
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      product = Product.create(name: 'Item', description: 'Test Item', price: '50')
      delete :destroy, params: { id: product.id }
      expect redirect_to products_path
    end
  end
end
