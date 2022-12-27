class PlacesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @place = Place.new
  end

  def create
    raise
    @trip = Trip.find(params[:trip_id])
    @place = Place.new(place_params)
    @place.trip = @trip

    if @place.save
      Expense.create(
        trip: @trip,
        rental: @place,
        category: @category,
        date: @rental.start_time
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :status, :paid, :address, :price_cents, :comment)
  end
end
