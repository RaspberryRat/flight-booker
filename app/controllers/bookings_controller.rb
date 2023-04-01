class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by id: params[:flight_id]
    @num_passengers = params[:passenger_count]
    @num_passengers.to_i.times { @flight.passengers.build }

  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:success] = "You booked!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id, passenger_attributes: [:id, :name, :email])
  end
end
