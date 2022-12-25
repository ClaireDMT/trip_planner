class Transit < ApplicationRecord
  belongs_to :trip
  has_many_attached :attachments
  enum transport_type: { plane: 0, train: 1, bus: 2, car_pooling: 3 }

  monetize :price_cents
end
