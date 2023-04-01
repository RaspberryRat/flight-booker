class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
