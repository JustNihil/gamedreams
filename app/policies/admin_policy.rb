class AdminPolicy < ApplicationPolicy
    attr_reader :user, :product
  
    def initialize(user, product)
      @user = user
      @product = product
    end
  
    def index?
      @user.present? && @user.admin?
    end
  end