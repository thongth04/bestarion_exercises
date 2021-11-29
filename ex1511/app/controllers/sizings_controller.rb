class SizingsController < ApplicationController
  before_action :find_product, except: [:edit]
  
  def new
    @sizing = @product.sizings.build
  end
  
  def create
    @sizing = @product.sizings.create(sizing_params)
    redirect_to product_path(@product)
  end

  def edit
    @sizing = Sizing.find(params[:product_id])
    @product = @sizing.product
  end

  def update
    @sizing = @product.sizings.find(params[:id])

    if @sizing.update(sizing_params)
      redirect_to @product
    else
      render :edit
    end
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
