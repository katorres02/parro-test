require 'minitest/autorun'

describe Checkout do
  before do
    @co = Checkout.new(PRICING_RULES)
  end

  describe "Create new object, initilize variables" do
    it "products array" do
      @co.products.length.must_equal 3
      @co.products.first.code.must_equal 'VOUCHER'
    end

    it "promotions array" do
      @co.promotions.length.must_equal 2
      @co.promotions.first.product_code.must_equal 'VOUCHER'
    end
  end

  describe "Adding products to cart" do
    it "scan product" do
      @co.cart.empty?.must_equal true
      @co.scan('VOUCHER')
      @co.cart.empty?.must_equal false
      assert_includes(@co.cart.keys, 'VOUCHER')
    end

    it "scan non existing product, should not be added to the cart" do
      @co.cart.empty?.must_equal true
      @co.scan('NOT-FOUND')
      @co.cart.empty?.must_equal true
    end
  end

  describe 'Total calculation' do
    it 'tes case scenario 1' do
      @co.scan('VOUCHER')
      @co.scan('TSHIRT')
      @co.scan('MUG')
      @co.total.must_equal '32.5 €'
    end

    it 'tes case scenario 2' do
      @co.scan('VOUCHER')
      @co.scan('TSHIRT')
      @co.scan('VOUCHER')
      @co.total.must_equal '25.0 €'
    end

    it 'tes case scenario 3' do
      @co.scan('TSHIRT')
      @co.scan('TSHIRT')
      @co.scan('TSHIRT')
      @co.scan('VOUCHER')
      @co.scan('TSHIRT')
      @co.total.must_equal '81.0 €'
    end

    it 'tes case scenario 4' do
      @co.scan('VOUCHER')
      @co.scan('TSHIRT')
      @co.scan('VOUCHER')
      @co.scan('VOUCHER')
      @co.scan('MUG')
      @co.scan('TSHIRT')
      @co.scan('TSHIRT')
      @co.total.must_equal '74.5 €'
    end
  end

  describe "Add elements to memory after the class has been initilized" do
    it 'add products' do
      @co.products.length.must_equal 3
      @co.add_product(Product.new)
      @co.products.length.must_equal 4
    end

    it 'add promotion rules' do
      @co.promotions.length.must_equal 2
      @co.add_promo(Promotion.new)
      @co.promotions.length.must_equal 3
    end
  end
end