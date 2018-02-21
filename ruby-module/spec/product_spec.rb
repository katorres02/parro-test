require 'minitest/autorun'
require_relative './../lib/product.rb'

describe Product do
  before do
    @product = Product.new(code: '123', name: 'test', price: 1)
  end

  describe "Create new object with params" do
    it "attributes ok" do
      @product.code.must_equal '123'
      @product.name.must_equal 'test'
      @product.price.must_equal 1
    end
  end

  describe "Create new object without params" do
  	it "default attributes assigned" do
  		@new_product = Product.new
  		@new_product.code.must_equal 'EXAMPLE_CODE'
      @new_product.name.must_equal 'EXAMPLE'
      @new_product.price.must_equal 0
  	end
  end
end