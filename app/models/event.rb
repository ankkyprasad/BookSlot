# frozen_string_literal: true

# Event Model
class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_rich_text :description

  validates :name, :duration, presence: true
  enum location: { meet: 0, zoom: 1, team: 2 }
end
