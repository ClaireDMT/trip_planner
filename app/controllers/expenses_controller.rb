class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update]

  def index
    @trip = Trip.includes(:expenses).find(params[:trip_id])
    @share = @trip.share
    @expenses = @trip.expenses.order(date: :desc)
  end

  def update
    @expense.update(expense_params)
    redirect_to trip_expenses_path(@expense.trip)
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.new(expense_params)
    @expense.trip = @trip
    if @expense.save
      redirect_to trip_expenses_path(@trip), status: :see_other
    else
      render "new"
    end
  end

  private

  def set_expense
    @expense = Expense.includes(:user, :lodging, :transit, :place, :rental, [trip: [trip_users: :user]]).find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :price_cents, :category_id, :split, :date, :comment)
  end
end
