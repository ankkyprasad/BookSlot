# frozen_string_literal: true

# Events Controller
class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_event, only: %i[edit update destroy]
  before_action :set_show_event, only: %i[show]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find_by!(id: params[:id], user_id: current_user.id)
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :color, :duration, :payment_required, :price)
  end

  def set_show_event
    @event = Event.find_by!(id: params[:id])
  end
end
