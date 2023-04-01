class AddReferenceToPassengersRemoveFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :passenger_id
    add_reference :passengers, :booking, foreign_key: true
  end
end
