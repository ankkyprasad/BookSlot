# frozen_string_literal: true

# Booking Mailer
class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.verify_booking.subject
  #
  def verify_booking(booking)
    @booking = booking

    mail to: @booking.email
  end
end
