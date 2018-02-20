class Promotion
  attr_accessor :product_code, :formula, :count, :price
  
  def initialize(args = {})
    @product_code = args[:product_code]
    @formula = args[:formula]

    @count   = args[:count]
    @price   = args[:price]
  end

  def apply
    eval(@formula)
  end
end
