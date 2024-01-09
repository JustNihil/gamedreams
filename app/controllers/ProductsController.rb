class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  def index
    @products = Product.all
  end

  def show
    @user_buy_current_product = user_signed_in? && current_user.products.where(id: params[:id]).any?
  end

  def new
    @product = Product.new
    authorize @product
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  def edit
    authorize @product
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to :admin_page, notice: "Игра была успешно создана." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to :admin_page, notice: "Игра была успешно обновлена." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      authorize @product
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Игра была успешно удалена." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end