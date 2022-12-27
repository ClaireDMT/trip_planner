class TripsController < ApplicationController
  before_action :set_trip, only: %i[show map details overview itinerary budget]
  def index
    @trips = current_user.trips
  end

  def map
    @lodging_markers = markers(@trip.lodgings)
    @rental_markers = markers(@trip.rentals)
    @place_markers = markers(@trip.places)
  end

  private

  def set_trip
    @trip = Trip.includes(:lodgings, :rentals, :places, :expenses, trip_users: [:user]).find(params[:id])
  end

  def markers(things)
    things.geocoded.map do |thing|
      {
        lat: thing.latitude,
        lng: thing.longitude
      }
    end
  end
end
