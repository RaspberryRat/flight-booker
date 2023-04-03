class Flight < ApplicationRecord
  MINUTES_PER_HOUR = 60
  validates :departure_time, presence: true
  validates :flight_duration, presence: true

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  def self.show_departure_dates
    Flight.select(:departure_time).distinct.order(:departure_time)
  end

  def departure_date_human_readable_format
    departure_time.strftime('%B %e, %Y')
  end

  def departure_date_year_first_format
    departure_time.strftime('%Y/%m/%d')
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
    return 'No Flights are Available' if self.flight_search(params).nil?

    self.flight_search(params)
  end

  def time_of_departure
    time = minutes_to_hours_and_minutes(departing_time)
    hour = time[0].to_s
    minute = time[1].to_s
    hour.prepend('0') if hour.length == 1
    minute.prepend('0') if hour.length == 1

    "#{hour}:#{minute}"
  end

  def flight_duration_in_hours
    flight_time = minutes_to_hours_and_minutes(flight_duration)
    hours = flight_time[0]
    minutes = flight_time[1]
    "#{hours} hours and #{minutes} minutes"
  end

  private

  def minutes_to_hours_and_minutes(minutes)
    time = []
    time << minutes / MINUTES_PER_HOUR
    time << minutes % MINUTES_PER_HOUR
  end

  def self.flight_search(params)
    Flight.where(departure_airport_id: params[:departure_airport_id]).where(arrival_airport_id: params[:arrival_airport_id]).where(departure_time: params[:departure_time]).take(3)
  end
end
