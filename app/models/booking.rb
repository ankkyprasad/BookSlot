# frozen_string_literal: true

# Booking Model
class Booking < ApplicationRecord
  belongs_to :event
  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
