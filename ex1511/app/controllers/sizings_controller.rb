class SizingsController < ApplicationController
  before_action :find_product

  def create
    @sizing = @product.sizings.create(sizing_params)
    redirect_to product_path(@product)
  end

  def edit
  end

  def update
  end

  def destroy
    @sizing = @product.sizings.find(params[:id])
    @sizing.destroy
    redirect_to product_path(@product)
  end

  private
    def find_product
      @product = Product.find(params[:product_id])
    end

    def sizing_params
      params.require(:sizing).permit(:size_tag, :quantity, :image)
    end
end
