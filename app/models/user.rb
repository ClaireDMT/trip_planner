class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trip_users, dependent: :destroy
  has_many :trips, through: :trip_users
  has_many :items, dependent: :destroy
  has_one_attached :photo

  def future_trips
    trips.where("start_date >= now()")
  end

  def future_and_current_trips
    trips.where("start_date <= now() AND end_date > now()")
  end

  def current_trip
    trips.where("start_date <= now() AND end_date > now()").first
  end

  def next_trip
    future_trips.order(start_date: :asc).first
  end

  def next_trip_in
    ((next_trip.start_date - Time.now) / 86400).round
  end
end
