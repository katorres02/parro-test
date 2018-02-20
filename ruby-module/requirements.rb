=begin
reglas:
2 x 1 en vouchers
2 x 1 en vouchers
3 o mas tshirts, el precio por unidad queda en 19



Searss checkout process allows for items to be scanned in any order,
and should return the total amount to be paid. The interface for the
checkout process looks like this (ruby):

ruby co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total


Examples:

Items: VOUCHER, TSHIRT, MUG. # no rules applied
Total: 32.50€

Items: VOUCHER, TSHIRT, VOUCHER # 2x1 applied 
Total: 25.00€

Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT # 3 o more applied
Total: 81.00€


Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT # 3 o mas y 2x1
Total: 74.50€
=end