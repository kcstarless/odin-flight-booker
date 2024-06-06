class AddIndexToAirportCode < ActiveRecord::Migration[7.1]
  def change
    add_index :airports, :airport_code, unique: true
  end
end
