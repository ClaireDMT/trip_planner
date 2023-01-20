class PlacesController < ApplicationController
  before_action :set_place, only: %i[edit update]

  def new
    @trip = Trip.find(params[:trip_id])
    @place = Place.new
  end

  def update
    @place.update(place_params)
    redirect_to trip_path(@place.trip)
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @place = Place.new(place_params)
    @place.trip = @trip

    if @place.save
      Expense.create(
        trip: @trip,
        rental: @place,
        category: @category,
        comment: @place.name,
        date: Date.today
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name,
                                  :status,
                                  :paid,
                                  :address,
                                  :price_cents,
                                  :comment,
                                  attachments: [])
  end
end
