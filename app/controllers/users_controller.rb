# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def show
    @user = User.find_by!(slug: params[:slug])
  end
end
