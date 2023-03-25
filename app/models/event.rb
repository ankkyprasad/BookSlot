# frozen_string_literal: true

# Event Model
class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_rich_text :description

  validates :name, :duration, presence: true
  enum location: { Meet: 0, Zoom: 1, Teams: 2 }
end
