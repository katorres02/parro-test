class Checkout
  attr_reader :products, :cart, :promotions
  
  def initialize(promos = {})
    @products   = []
    @promotions = []
    @cart = Hash.new({product: nil, count: 0})

    load_initial_products
    set_promos(promos)
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
        result += promo.apply(@cart[x][:count], @cart[x][:product].price)
      end
    end
    result.to_s + " €"
  end

  def add_product(product)
    @products << product
  end

  def add_promo(promo)
    @promotions << promo
  end

private
  
  def find_by(source, query = {})
    source.select { |x| x.send(query.keys.first) == query.values.first }.first
  end

  def load_initial_products
    add_product Product.new(code: 'VOUCHER', name: 'Sears Voucher', price: 5.00)
    add_product Product.new(code: 'TSHIRT', name: 'Sears T-Shirt', price: 20.00)
    add_product Product.new(code: 'MUG', name: 'Cafify Coffee Mug', price: 7.50)
  end

  def set_promos(promos)
    promos.each do |x|
      add_promo Promotion.new(product_code: x[:product_code], formula: x[:formula])
    end
  end
end
