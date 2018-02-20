class Checkout
  attr_reader :products, :cart, :promotions
  
  def initialize(promos = {})
    @products   = load_products
    @promotions = set_promos(promos)
    @cart       = Hash.new({count: 0})
  end

  def scan(code)
    product = find_by(@products, code: code)
    return if product.nil?   
    @cart[product.code] = { product: product, count: @cart[product.code][:count] + 1 }
  end

  def total
    result = 0
    @cart.keys.each do |x|
      promo = find_by(@promotions, product_code: x)
      if promo.nil?
        result += @cart[x][:product].price * @cart[x][:count]
      else
        promo.count = @cart[x][:count]
        promo.price = @cart[x][:product].price
        result += promo.apply
      end
    end
    result.to_s + " €"
  end

private
  
  def find_by(source, query = {})
    source.select { |x| x.send(query.keys.first) == query.values.first }.first
  end

  def load_products
    [
      Product.new(code: 'VOUCHER', name: 'Sears Voucher', price: 5.00),
      Product.new(code: 'TSHIRT', name: 'Sears T-Shirt', price: 20.00),
      Product.new(code: 'MUG', name: 'Cafify Coffee Mug', price: 7.50)
    ]
  end

  def set_promos(promos)
    promos.collect do |x|
      Promotion.new(product_code: x[:product_code], formula: x[:formula])
    end
  end
end
