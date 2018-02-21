class ParrolabsController < ApplicationController
  before_action :instance_checkout #called from ApllicationController

  # checkout classes were placed in app/lib becouse rails 5+ autoload this folder
  # in production and autoreload un development
  #
  # Initial promotion rules are planced inside config/initializers/checkout.rb
  #
  # Load the initial 3 products to show in the view
  def index
    @products = @co.products
  end
end