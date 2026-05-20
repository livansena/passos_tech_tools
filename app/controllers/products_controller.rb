class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end

    if params[:query].present?
      @products = @products.where(
        "name ILIKE ? OR description ILIKE ? OR category ILIKE ?",
        "%#{params[:query]}%",
        "%#{params[:query]}%",
        "%#{params[:query]}%"
      )
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end