class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @bookmark = Bookmark.new
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to products_url, notice: "Product deleted."
  end
end
