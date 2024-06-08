class CreatePassengers < ActiveRecord::Migration[7.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :booking, null: false, foreign_key: { to_table: :bookings }
      t.timestamps
    end
  end
end
