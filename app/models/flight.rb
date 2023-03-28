class Flight < ApplicationRecord
  validates :departure_time, presence: true
  validates :flight_duration, presence: true

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'


  # def self.get_event_dates
  #   event_dates = UgradRsvp.find_by_sql("select distinct event_date from admissions.ugrad_rsvps where event_date is not null order by event_date desc")
  # end

  def self.get_departure_dates
    Flight.select(:departure_time).distinct
  end

  def departure_date_formatted
    departure_time.strftime('%B %e, %Y')
  end
end
