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
end
