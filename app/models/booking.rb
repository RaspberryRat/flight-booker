class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  belongs_to :passenger, inverse_of: :bookings # TODO doesn;t work
  accepts_nested_attributes_for :passengers
end
