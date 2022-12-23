class TripsController < ApplicationController
  before_action :set_trip, only: [:show]
  def index
    @trips = current_user.trips
  end

  def show
  end

  private

  def set_trip
    @trip = Trip.includes(:lodgings, :rentals, :places, :expenses, trip_users: [:user]).find(params[:id])
  end
end
