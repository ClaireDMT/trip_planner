class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :lodgings, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :transits, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_one_attached :photo

  def budget
    expenses.sum(:price_cents)
  end

  def balance
    query = "SELECT users.username, SUM(price_cents) FROM expenses
    JOIN trips ON expenses.trip_id = trips.id
    JOIN trip_users ON trip_users.trip_id = trips.id
    JOIN users ON trip_users.user_id = users.id
    WHERE expenses.trip_id = #{id}
    GROUP BY users.username"
    ActiveRecord::Base.connection.exec_query(query, "SQL").to_a
  end

  def expenses_by(user)
    expenses.where(user:)
  end
end
