class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update]

  def index
    @trip = Trip.includes(:items).find(params[:trip_id])
    @items = @trip.items
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @item = Item.new(item_params)
    @item.trip = @trip
    # @category = Category.find_by(name: "Lodging")

    if @item.save!
      redirect_to trip_path(@trip)
    else
      render "trips/show"
    end
  end

  def update
    @items.update(item_params)
    redirect_to trip_path(@item.trip)
  end

  private

  def set_item
    @item = item.includes(:user, :trip).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:user_id, :category, :packed, :name)
  end
end
