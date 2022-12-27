class ExpensesController < ApplicationController
  def index
    @trip = Trip.includes(:expenses).find(params[:trip_id])
    @expenses = @trip.expenses
  end
end
