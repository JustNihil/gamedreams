class AdminController < ApplicationController
    def index
      @products = Product.all
      authorize Product, policy_class: AdminPolicy
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
    end
  end