class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :lodgings, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :transits, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :items, dependent: :destroy
  has_one_attached :photo

  def budget
    expenses.sum(:price_cents)
  end

  def balance
    query = "SELECT users.username, SUM(expenses.price_cents) FROM expenses
    INNER JOIN users ON expenses.user_id = users.id
    WHERE expenses.trip_id = #{id}
    group by 1"
    ActiveRecord::Base.connection.exec_query(query, "SQL").to_a
  end

  def expenses_by(user)
    expenses.where(user:)
  end
end
