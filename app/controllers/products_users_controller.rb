class ProductsUsersController < ApplicationController
    before_action :authenticate_user!
  
    def buy
      product = Product.find params[:id]
      unless current_user.products.where(id: params[:id]).any?
        current_user.products << product
      end
      redirect_to product
    end
  
    def cancel
      product = Product.find params[:id]
      if current_user.products.where(id: params[:id]).any?
        current_user.products.delete product.id
      end
      redirect_to product
    end
  end