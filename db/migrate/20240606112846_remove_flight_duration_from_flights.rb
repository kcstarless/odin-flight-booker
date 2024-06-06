class RemoveFlightDurationFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :flight_duration, :time
    add_column :flights, :flight_duration, :integer
  end
end
