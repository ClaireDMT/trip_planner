class TransitsController < ApplicationController
  before_action :set_transit, only: %i[edit update]

  def new
    @trip = Trip.find(params[:trip_id])
    @transit = Transit.new
  end

  def update
    @trip = @transit.trip
    @transit.update(transit_params)
    redirect_to trip_path(@transit.trip)
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
        comment: "#{@transit.from.split(",").first}- #{@transit.to.split(",").first}",
        price_cents: @transit.price_cents,
        date: Date.today
      )
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  private

  def set_transit
    @transit = Transit.find(params[:id])
  end

  def transit_params
    params.require(:transit).permit(:from,
                                    :to,
                                    :paid,
                                    :start_time,
                                    :end_time,
                                    :transport_type,
                                    :price_cents,
                                    :comment,
                                    attachments: [])
  end
end
