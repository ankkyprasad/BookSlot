# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  def show
    @user = User.find_by(slug: params[:slug])
  end
end
