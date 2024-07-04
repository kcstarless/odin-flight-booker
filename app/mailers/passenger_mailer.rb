class PassengerMailer < ApplicationMailer
  default from: "notification@example.com"
          # to: -> { @booking.passengers.pluck(:email) }

  def booking_confirmation_email
    @booking = params[:booking]
    # @booking_email = @booking.passengers.pluck(:email)
    @booking.passengers.each do |passenger|
      mail(to: passenger.email, subject: "Your flight booking is confirmed.")
    end
    # mail(subject: "Your flight booking is confirmed.")
  end
end
