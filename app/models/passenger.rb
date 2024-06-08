class Passenger < ApplicationRecord
  belongs_to :a_booking, class_name: "Booking", foreign_key: 'booking_id'
end
