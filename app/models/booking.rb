class Booking < ApplicationRecord
  belongs_to :a_flight, class_name: "Flight", foreign_key: "flight_id"
  has_many :booking_passengers, class_name: "Passenger", foreign_key: "booking_id"
end
