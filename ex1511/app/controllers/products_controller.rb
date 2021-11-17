class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    search_result = Product.search(params[:term])
    if search_result && search_result.length > 0
      @products = search_result
    else
      @products = Product.order(id: :desc).paginate(page: params[:page], per_page: 15)
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product was created successfully!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product was updated successfully!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product was deleted successfully!"
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:sku, :title, :price, :quantity, :image_url, :term)
  end

end