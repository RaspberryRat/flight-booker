class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by id: params[:flight_id]
    @num_passengers = params[:passenger_count]

  end

  def create

  end
end
