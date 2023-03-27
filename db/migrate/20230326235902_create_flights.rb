class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport
      t.references :arrival_airport
      t.datetime :departure_time
      t.interger :flight_duration

      t.timestamps
    end
  end
end
