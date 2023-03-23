# frozen_string_literal: true

# User Mailer
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(recipient)
    @greeting = 'Hi there'

    mail to: recipient
  end
end