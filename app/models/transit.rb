class Transit < ApplicationRecord
  belongs_to :trip
  has_many_attached :attachments

  monetize :price_cents
end
