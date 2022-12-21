class Transit < ApplicationRecord
  belongs_to :trip

  monetize :price_cents
end
