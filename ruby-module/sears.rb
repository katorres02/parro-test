require './product.rb'
require './promotion.rb'
require './checkout.rb'

pricing_rules = [{
  product_code: "VOUCHER",
  formula: "(count / 2.to_f).ceil * product.price"
}]

@co = Checkout.new(pricing_rules)
@co.scan('VOUCHER')
@co.scan('TSHIRT')

