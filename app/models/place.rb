class Place < ApplicationRecord
  belongs_to :trip
  has_many_attached :attachments
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  monetize :price_cents
end
