class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find_by id: params[:flight_id]
    @passengers = params[:passenger_count].to_i
    @passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: %i[id name email]
    )
  end
end
