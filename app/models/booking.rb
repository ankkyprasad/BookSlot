# frozen_string_literal: true

# Booking Model
class Booking < ApplicationRecord
  belongs_to :event
  enum status: { pending: 0, approved: 1, unapproved: 2 }
  validates :first_name, :last_name, :email, :start_at, presence: true
  validates :start_at, comparison: { greater_than: DateTime.now }
  after_create :send_verification_email
  after_destroy :send_cancel_email

  def send_verification_email
    verification_token = SecureRandom.hex
    update!(email_verification_token: verification_token)
    BookingMailer.verify_booking(self).deliver_now
  end

  def send_cancel_email
    BookingMailer.cancel_booking(self).deliver_now if email_verified
  end
end
