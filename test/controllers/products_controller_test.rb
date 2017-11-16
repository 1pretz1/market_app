require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @product = Product.find(1)
  end

  test 'edit a product and saves to db' do
    get edit_product_path(@product)
    #assert_template "products/edit"
    put 'products/update', params: { product: { name: 'hello', description: 'dirty sofa', category: 'furniture', price: 88 } }
    assert_template '/products/show'
  end

end
