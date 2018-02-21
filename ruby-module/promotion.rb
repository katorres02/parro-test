# The promotion rule class is responsable for executing the formula received in the Checkout constructor
# Containes the formula, number of items in the cart, the product price and the produc code associated to that formula
class Promotion
  attr_reader :product_code, :formula
  attr_accessor :count, :price # these variables will be assigned later
  
  def initialize(args = {})
    @product_code = args[:product_code]
    @formula      = args[:formula]
  end

  # this method is called inside the "total" method in Checkout class
  # receives the total of repeated products and its price
  # The "eval" function allows me to execute a string as ruby code. This is what's makes possible work
  #   with string rules in the main.rb file
  def apply(count, price)
    @count = count
    @price = price
    eval(@formula)
  end
end
