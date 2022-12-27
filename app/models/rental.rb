class Rental < ApplicationRecord
  belongs_to :trip
  has_many_attached :attachments
  enum rental_type: { car: 0, bike: 1, boat: 2 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  monetize :price_cents
end
