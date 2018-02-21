require './product.rb'
require './promotion.rb'
require './checkout.rb'

# This is the complete list of promotion rules that will be applied to each checkout cart order.
# This strcuture let me to create new rules easily for any product, only the product code is needed.
# I have noticed for each promotion rule in the problem description that they depends on 2 variables,
#   price and the number of items, This will be more easy to write a formula with those variables
#   then aplly that formula for its associated product

pricing_rules = [
  {
    product_code: "VOUCHER",
    formula: "(count / 2.to_f).ceil * price"
  },
  {
    product_code: "TSHIRT",
    formula: "count >= 3 ? count * 19.0 : count * price "
  }
]

# Test scenarios

#Items: VOUCHER, TSHIRT, MUG
puts "Items: VOUCHER, TSHIRT, MUG"
@co = Checkout.new(pricing_rules)
@co.scan('VOUCHER')
@co.scan('TSHIRT')
@co.scan('MUG')
price = @co.total
puts price
# Total: 32.50€

#Items: VOUCHER, TSHIRT, VOUCHER
puts "Items: VOUCHER, TSHIRT, VOUCHER"
@co1 = Checkout.new(pricing_rules)
@co1.scan('VOUCHER')
@co1.scan('TSHIRT')
@co1.scan('VOUCHER')
price = @co1.total
puts price
#Total: 25.00€

#Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
puts "Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT"
@co2 = Checkout.new(pricing_rules)
@co2.scan('TSHIRT')
@co2.scan('TSHIRT')
@co2.scan('TSHIRT')
@co2.scan('VOUCHER')
@co2.scan('TSHIRT')
price = @co2.total
puts price
#Total: 81.00€

#Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
puts "Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT"
@co3 = Checkout.new(pricing_rules)
@co3.scan('VOUCHER')
@co3.scan('TSHIRT')
@co3.scan('VOUCHER')
@co3.scan('VOUCHER')
@co3.scan('MUG')
@co3.scan('TSHIRT')
@co3.scan('TSHIRT')
price = @co3.total
puts price
#Total: 74.50€
