class RentalsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @rental = Rental.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @rental = Rental.new(rental_params)
    @rental.trip = @trip
    @category = Category.find_by(name: "Rental")

    if @rental.save
      Expense.create(
        trip: @trip,
        rental: @rental,
        category: @category,
        date: @rental.start_time
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:rental_type, :paid, :start_time, :end_time, :address, :price_cents, :comment)
  end
end
