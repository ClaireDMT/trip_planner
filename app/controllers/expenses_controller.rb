class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update]

  def index
    @trip = Trip.includes(:expenses).find(params[:trip_id])
    @expenses = @trip.expenses
  end

  def update
    @expense.update(expense_params)
    redirect_to trip_path(@expense.trip)
  end

  private

  def set_expense
    @expense = Expense.includes(:user, :trip, :lodging, :transit, :place, :rental).find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :category_id, :split, :date, :comment)
  end
end
