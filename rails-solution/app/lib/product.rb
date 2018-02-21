# It is important to have a class called Product, this allows me to add new attributes, methods and new logic
#   if needed to every single product.
# Also if the code, name or price are null they will have a default value using the "fetch" method, just in case.
class Product
  attr_accessor :code, :name, :price

  def initialize(args = {})
    @code  = args.fetch(:code, 'EXAMPLE_CODE')
    @name  = args.fetch(:name, 'EXAMPLE')
    @price = args.fetch(:price, 0)
  end
end
