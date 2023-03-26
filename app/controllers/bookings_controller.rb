# frozen_string_literal: true

# Booking controller
class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  before_action :destroy_authorization, only: %i[destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @bookings = Booking.all
  end

  def show
    @event = @booking.event
  end

  def new
    @booking = Booking.new
    @event = Event.find_by!(id: params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find_by!(booking_params[:event_id])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :email, :start_at, :event_id)
  end

  def destroy_authorization
    if current_user.nil? || current_user.id != @booking.event.user_id
      flash[:alert] = 'Unauthorized to delete the booking'
      redirect_to root_path, status: :unauthorized and return
    end
  end
end
