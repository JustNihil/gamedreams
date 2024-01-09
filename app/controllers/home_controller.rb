class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: [:profile]

  def index
    redirect_to products_path
  end

  def profile
    @current_user = current_user
    @products = current_user.products
  end
end
