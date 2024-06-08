class Booking < ApplicationRecord
  belongs_to :a_flight, class_name: "Flight", foreign_key: "flight_id"
end
