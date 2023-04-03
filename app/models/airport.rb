class Airport < ApplicationRecord
  validates :airport_code, presence: :true

  has_many :departing_flights, foreign_key: 'departure_airport_id', class_name: 'Flight'
  has_many :arriving_flights, foreign_key: 'arrival_airport_id', class_name: 'Flight'

  def airport_code_to_name
    case airport_code
    when 'YEG'
      'Edmonton'
    when 'YQM'
      'Montreal'
    when 'YOW'
      'Ottawa'
    when 'YYZ'
      'Toronto'
    when 'YVR'
      'Vancouver'
    end
  end
end
