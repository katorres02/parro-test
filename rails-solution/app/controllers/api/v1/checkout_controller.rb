# Inherited from ApiController
# API setup
# Allows me to create different versions of the api and new controllers for each version
class Api::V1::CheckoutController < ApiController
	before_action :instance_checkout # called from ApllicationController
	
	# calculate the price using the promotion rules set inside the config/initializers/checout.rb
	def calculate
		params[:vouchers].to_i.times { |i| @co.scan('VOUCHER') }
    params[:tshirts].to_i.times  { |i| @co.scan('TSHIRT') }
    params[:mugs].to_i.times     { |i| @co.scan('MUG') }
		render json: { price: @co.total }, status: :ok
	end
end