class Flight < ApplicationRecord
  validates :departure_time, presence: true
  validates :flight_duration, presence: true

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.show_departure_dates
    Flight.select(:departure_time).distinct
  end

  def departure_date_formatted
    departure_time.strftime('%B %e, %Y')
  end

  def self.show_departure_airports
    airports = Flight.select(:departure_airport_id).distinct
    airport_codes = airports.map do |a|
      a.departure_airport_id
    end
    Airport.where(id: airport_codes).sort
  end

  def self.show_arrival_airports
    airports = Flight.select(:arrival_airport_id).distinct
    airport_codes = airports.map do |a|
      a.arrival_airport_id
    end
    Airport.where(id: airport_codes).sort
  end

  def self.find_flights(params)
    Flight.where(departure_airport_id: params[:departure_airport_id]).where(arrival_airport_id: params[:arrival_airport_id])
  end

  # # take data from controller and find it in database I think a class method
  # def self.find_flights(params)
  #   # identify airports with find_airport method
  #   departing_airport = find_airport(params[:departure_airport_id])
  #   arriving_airport = find_airport(params[:arrival_airport_id])

  #   # Find that matches multiple conditions
  #   Flight.where()

  # end

  # def find_airport_id(airport_id)
  #   Airport.find_by(id: airport_id).id
  # end
end
