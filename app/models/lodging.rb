class Lodging < ApplicationRecord
  belongs_to :trip
  has_many_attached :attachments
end
