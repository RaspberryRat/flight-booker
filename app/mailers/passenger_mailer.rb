class PassengerMailer < ApplicationMailer
  default from: "smellycosby@gmail.com"

  def confirmation_email
    mail(
      to: email_address_with_name(passenger.email, passenger.name),
      subject: "Booking Confirmation for flight ##{booking.flight.id}"
    )
  end
end
