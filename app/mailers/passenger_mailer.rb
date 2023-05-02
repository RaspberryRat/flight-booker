class PassengerMailer < ApplicationMailer
  default from: "smellycosby@gmail.com"

  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]

    mail(
      to: email_address_with_name(@passenger.email, @passenger.name),
      subject: "Booking Confirmation for flight ##{@booking.flight.id}"
    )
  end
end
