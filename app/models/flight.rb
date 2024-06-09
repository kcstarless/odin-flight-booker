class Flight < ApplicationRecord
  # Associations.
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  # Validations.
  validates :departure_airport, :arrival_airport, :flight_date_time, :flight_duration, presence: true
  validate :departure_arrival_airport_must_be_different

  private

  def departure_arrival_airport_must_be_different
    if departure_airport_id == arrival_airport_id
      error.add(:arrival_airport_id, "must be different from departure airport")
    end
  end
end
