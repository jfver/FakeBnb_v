class BookingsController < ApplicationController

  def create
    product_id = params["booking"][:product_id]
    @booking = Booking.new(set_params)
    @booking.user_id = current_user.id
    start_date= params["booking"][:start_date]
    end_date= params["booking"][:end_date]
    #@booking.product_id = params["booking"][:product_id]
    start_date_comparision = Date.parse(start_date)
    if end_date < start_date
      redirect_to product_path(product_id), notice: "End date must be after start date."
    elsif start_date_comparision < Date.today
      redirect_to product_path(product_id), notice: "Start date must be after today."
    elsif @booking.save
      redirect_to root_path, notice: "Booking created successfully."
    else
      redirect_to new_user_session_path, alert: "Booking creation failed. Please log in."
    end
  end
  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date, :product_id)
  end
end
