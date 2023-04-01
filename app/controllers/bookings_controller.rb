class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find_by id: params[:flight_id]
    @passengers = params[:passenger_count].to_i

  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:success] = "You booked on flight #{Booking.last.flight_id}!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passenger_attributes: [:id, :name, :email])
  end
end
