# frozen_string_literal: true

# Event Model
class Event < ApplicationRecord
  belongs_to :user
  has_rich_text :description

  validates :name, presence: true
  validates :duration, presence: true
end
