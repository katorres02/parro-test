class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # create an object from checkout class
  #
  # I placed this method here in order to call it from all the classes
  # inherited form ApplicationController including the API controller
  def instance_checkout
    @co = Checkout.new(PRICING_RULES)
  end
end
