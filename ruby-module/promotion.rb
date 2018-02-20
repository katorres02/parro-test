class Promotion
  attr_reader :product_code, :formula
  attr_accessor :count, :price
  
  def initialize(args = {})
    @product_code = args[:product_code]
    @formula      = args[:formula]
  end

  def apply(count, price)
    @count = count
    @price = price
    eval(@formula)
  end
end
