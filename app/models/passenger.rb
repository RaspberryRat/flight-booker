class Passenger < ApplicationRecord
  validates :name, presence: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true

  has_many :flights, through: :bookings
end
