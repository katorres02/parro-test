class Product
  attr_accessor :code, :name, :price

  def initialize(args = {})
    @code  = args.fetch(:code, 'EXAMPLE_CODE')
    @name  = args.fetch(:name, 'EXAMPLE')
    @price = args.fetch(:price, 0)
  end
end
