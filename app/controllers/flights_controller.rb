class FlightsController < ApplicationController
  def index
    @view = params[:departure_time]
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :departure_time)
  end
end
