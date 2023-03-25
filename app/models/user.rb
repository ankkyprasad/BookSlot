# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :confirmable

  validates :name, presence: true
  has_many :events, dependent: :destroy
  after_create :save_slug

  def save_slug
    update!(slug: email.split('@')[0])
  end
end
