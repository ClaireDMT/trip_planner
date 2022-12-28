class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :user, optional: true
  belongs_to :transit, optional: true
  belongs_to :lodging, optional: true
  belongs_to :rental, optional: true
  belongs_to :place, optional: true
  belongs_to :category

  monetize :price_cents
  has_many_attached :attachments
end
