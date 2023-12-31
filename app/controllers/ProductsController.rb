class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
     @product = Product.find(params[:id])
   end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Товар успешно создан!'
    else
      render :new
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update(product_params)
      redirect_to @product, notice: "Товар успешно обновлен."
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Товар успешно удален."
  end

  private

  def product_params
    params.require(:product).permit(:name,:price, :id)
  end
end