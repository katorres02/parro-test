class Checkout
  attr_reader :products, :cart, :promotions
  
  def initialize(promos = {})
    @products   = load_products
    @promotions = set_promos(promos)
    @cart     = []
  end

  def scan(code)
    product = find_by(code: code)
    @cart << product unless product.nil?
  end

  def total
    #x = @co.cart.inject(Hash.new(0)) { |h, e| h[e.code] += 1 ; h }
    @cart.map(&:price).inject(0, :+).to_s + "€"
  end

private
  
  def find_by(query = {})
    @products.select { |x| x.send(query.keys.first) == query.values.first }.first
  end

  def load_products
    [
      Product.new(code: 'VOUCHER', name: 'Sears Voucher', price: 5.00),
      Product.new(code: 'TSHIRT', name: 'Sears T-Shirt', price: 20.00),
      Product.new(code: 'MUG', name: 'Cafify Coffee Mug', price: 7.00)
    ]
  end

  def set_promos(promos)
    promos.collect do |x|
      Promotion.new(product_code: x[:product_code], formula: x[:formula])
    end
  end
end
