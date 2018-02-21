class ParrolabsController < ApplicationController
  before_action :start_checkout

  def index
    @products = @co.products
  end

  def calculate
    params[:vouchers].to_i.times { |i| @co.scan('VOUCHER') }
    params[:tshirts].to_i.times { |i| @co.scan('TSHIRT') }
    params[:mugs].to_i.times { |i| @co.scan('MUG') }
    @price = @co.total
  end

private
  
  # checkout classes were placed in app/lib becase rails 5+ autoload this folder
  # in production and autoreload un development
  def start_checkout
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
    @co = Checkout.new(pricing_rules)
  end
end