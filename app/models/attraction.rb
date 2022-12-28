class Attraction < ApplicationRecord
  has_many :places, dependent: :destroy
end
