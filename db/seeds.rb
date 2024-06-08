require 'faker'

# Destroy all data
Flight.destroy_all
Airport.destroy_all


# Create airport data
Airport.create(airport_code: 'JFK')
Airport.create(airport_code: 'MEL')
Airport.create(airport_code: 'SYD')
Airport.create(airport_code: 'CGK')
Airport.create(airport_code: 'ICN')
Airport.create(airport_code: 'KIX')

p "created #{Airport.count} airports"

# Get all airports
airports = Airport.all

# Create flight data
airports.each_with_index do |departure_airport, index|
  next_airport = airports[(index + 1) % airports.size] # Ensures arrival airport is different
  10.times do
    Flight.create(departure_airport: departure_airport,
                  arrival_airport: next_airport,
                  flight_date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
                  flight_duration: Faker::Number.between(from: 60, to: 720))
  end
end

p "created #{Flight.count} flights"
