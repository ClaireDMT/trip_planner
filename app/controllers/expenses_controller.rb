class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update]

  def index
    @trip = Trip.includes(:expenses).find(params[:trip_id])
    @expenses = @trip.expenses.order(date: :desc)
  end

  def update
    @expense.update(expense_params)
    redirect_to trip_expenses_path(@expense.trip)
  end

  private

  def set_expense
    @expense = Expense.includes(:user, :lodging, :transit, :place, :rental, [trip: [trip_users: :user]]).find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :price_cents, :category_id, :split, :date, :comment)
  end
end
