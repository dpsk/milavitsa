class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(16)
    respond_to do |format|
      format.js
      format.html # index.html.erb
    end
  end

  def show
    @product = Product.find(params[:id])
    render "show", layout: false
  end
end
