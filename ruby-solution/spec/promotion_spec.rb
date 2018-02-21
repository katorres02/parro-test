require 'minitest/autorun'
require_relative './../lib/product.rb'
require_relative './../lib/promotion.rb'

describe Promotion do
  before do
    @product = Product.new(code: '123', name: 'test', price: 10)
    @promo = Promotion.new(product_code: @product.code, formula: '(count / 2.to_f).ceil * price')
  end

  describe "Create new promotion" do
    it "set params, attributes should be ok" do
      @promo.product_code.must_equal @product.code
      @promo.formula.must_equal '(count / 2.to_f).ceil * price'
    end

    it "without params, attributes should have default values" do
      @new_promo = Promotion.new
      @new_promo.product_code.must_equal ''
      @new_promo.formula.must_equal ''
    end
  end

  describe "Promotion rules" do
    it "test '2x1' formula" do
      @promo.apply(1, @product.price).must_equal 10
      @promo.apply(2, @product.price).must_equal 10
      @promo.apply(3, @product.price).must_equal 20
      @promo.apply(4, @product.price).must_equal 20
    end

    it "test '3 or more' formula" do
      @new_promo = Promotion.new(product_code: @product.code, formula: 'count >= 3 ? count * 19.0 : count * price')
      @new_promo.apply(3, @product.price).must_equal 57
      @new_promo.apply(10, @product.price).must_equal 190
    end

    it 'raise and error if no price/count is set' do
      @new_promo = Promotion.new(product_code: @product.code, formula: 'count >= 3 ? count * 19.0 : count * price')
      
      assert_raises ArgumentError do 
        @new_promo.apply
      end
    end
  end
end