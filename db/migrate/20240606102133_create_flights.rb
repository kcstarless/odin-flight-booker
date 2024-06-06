class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :departing_airport_id, null: false
      t.string :arrival_airport_id, null: false
      t.date :flight_date_time, null: false
      t.time :flight_duration, null: false

      t.timestamps
    end
  end
end
