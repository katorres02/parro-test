#Code | Name | Price
#VOUCHER | Sears Voucher | 5.00€
#TSHIRT | Sears T-Shirt | 20.00€
#MUG | Cafify Coffee Mug | 7.50€
class Product
  attr_accessor :code, :name, :price

  def initialize(args = {})
    @code  = args.fetch(:code, 'EXAMPLE_CODE')
    @name  = args.fetch(:name, 'EXAMPLE')
    @price = args.fetch(:price, 0)
  end
end
