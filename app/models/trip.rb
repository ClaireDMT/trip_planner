class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :lodgings, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :transits, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
