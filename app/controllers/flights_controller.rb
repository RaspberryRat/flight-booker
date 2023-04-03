class FlightsController < ApplicationController
  def index
    @flights = Flight.find_flights(flight_params)
    @date = flight_search_date(@flight)
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :departure_time)
  end

  def flight_search_date(flight)
    return nil if flight.blank?

    flight.first.departure_date_human_readable_format
  end
end
