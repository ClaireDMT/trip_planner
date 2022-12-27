class LodgingsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @lodging = Lodging.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @lodging = Lodging.new(lodging_params)
    @lodging.trip = @trip
    @category = Category.find_by(name: "Lodging")

    if @lodging.save
      Expense.create(
        trip: @trip,
        lodging: @lodging,
        category: @category,
        date: @lodging.start_time
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def lodging_params
    params.require(:lodging).permit(:name, :link, :paid, :start_time, :end_time, :address, :price_cents, :price_per_night_cents)
  end
end