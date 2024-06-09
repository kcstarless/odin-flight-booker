class BookingsController < ApplicationController
  def new
    @no_passengers = params[:ticket_count].to_i
    @flight_info = Flight.find(params[:selected_flight_id])
    @booking = Booking.new
    @no_passengers.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    puts "Parameters received: #{params.inspect}"
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, success: 'Booking successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
