class TransitsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @transit = Transit.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @transit = Transit.new(transit_params)
    @transit.trip = @trip
    @category = Category.find_by(name: "Transportation")

    if @transit.save
      Expense.create(
        trip: @trip,
        transit: @transit,
        category: @category,
        date: @transit.start_time
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def transit_params
    params.require(:transit).permit(:from, :to, :paid, :start_time, :end_time, :transport_type, :price_cents, :comment)
  end
end
