class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    PassengerMailer.with(
      passenger: Booking.last.passengers.first,
      booking: Booking.last
    ).confirmation_email
  end
end
