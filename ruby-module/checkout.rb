# This class is responsable for shopping process, add new productos to the cart and calculate the total price
#   including the promotion rules.
class Checkout
  attr_reader :products, :cart, :promotions
  
  def initialize(promos = {})
    @products   = []
    @promotions = []
    # default structure of each element inside the cart objetc
    # this structure allows to easily find the number of products with the same code avoiding
    #   to loop through the cart object every time we call the total method
    @cart = Hash.new({product: nil, count: 0})

    # load 3 initial products inside the products array
    load_initial_products
    # load the promotion rules received in this constructor inside the promotions array
    set_promos(promos)
  end

  # recive a product code then find a product with that code and add that product to the cart
  # calculate the number of products added with the same code
  def scan(code)
    # find a product by code
    product = find_by(@products, code: code)
    return if product.nil? # return in case of product was not found
    # the following line creates a structura for a cart object like this:
    # {
    #   "VOUCHER"=> { product: Product.info.object, count: 2 },
    #   "TSHIRT" => { product: Product.info.object, count: 5 },
    #   "MUG"    => { product: Product.info.object, count: 1 },
    # }
    # this is an easy way to get the total number of product of each type
    @cart[product.code] = { product: product, count: @cart[product.code][:count] + 1 }
  end

  # calculate the toal price to pay after apply the promo rules
  def total
    result = 0
    # loop through the cart object
    @cart.keys.each do |x|
      # try to find a promotional rule for that set of produts
      promo = find_by(@promotions, product_code: x)
      if promo.nil?
        # if no promo rule is present the price must be calculate as always "price * quantity"
        result += @cart[x][:product].price * @cart[x][:count]
      else
        # if a promo rule is present the price must be calculate using that rule
        # call the "apply" method from Promotion class
        result += promo.apply(@cart[x][:count], @cart[x][:product].price)
      end
    end
    result.to_s + " €"
  end

  # add a new product object to the main list of products( @products )
  # useful if you want to add more products after the class has been initialized
  def add_product(product)
    @products << product
  end

  # add a new promo rule object to the main list of promotions( @promotions )
  # useful if you want to add more rules after the class has been initialized
  def add_promo(promo)
    @promotions << promo
  end

  # with this solution will be easy to create a method that remove/update a product or promotion rule

private
  
  # find one element inside any array of objects, receives the source array and the query like active-record does
  # query eg: 
  # => code: '123'
  # => name: 'test'
  # => price: 1
  # you can use this method in any array of objects like products or promotions
  def find_by(source, query = {})
    source.select { |x| x.send(query.keys.first) == query.values.first }.first
  end

  # load the main 3 products inside the produts array
  def load_initial_products
    add_product Product.new(code: 'VOUCHER', name: 'Sears Voucher', price: 5.00)
    add_product Product.new(code: 'TSHIRT', name: 'Sears T-Shirt', price: 20.00)
    add_product Product.new(code: 'MUG', name: 'Cafify Coffee Mug', price: 7.50)
  end

  # set the promotion rules inside de protions array
  def set_promos(promos)
    promos.each do |x|
      add_promo Promotion.new(product_code: x[:product_code], formula: x[:formula])
    end
  end
end
