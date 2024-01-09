class ProductPolicy < ApplicationPolicy
    attr_reader :user, :product
  
    def initialize(user, product)
      @user = user
      @product = product
    end
  
    def create?
      @user.present? && @user.admin?
    end
  
    def update?
      @user.present? && @user.admin?
    end
  
    def destroy?
      @user.present? && @user.admin?
    end
  end