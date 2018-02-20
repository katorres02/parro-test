class Promotion
  attr_accessor :product_code, :formula
  
  def initialize(args = {})
    @product_code = args[:product_code]
    @formula = args[:formula]

    @count   = args[:count]
    @price   = args[:price]
  end

  def calculate(count, price)
    @count = count
    @price = price

    eval(@formula)
  end
end
