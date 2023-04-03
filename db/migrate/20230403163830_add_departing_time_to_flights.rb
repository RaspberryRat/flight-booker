class AddDepartingTimeToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :departing_time, :integer
  end
end
