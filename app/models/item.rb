class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trip

  CATEGORIES = ["Accessories", "Clothing", "Documents", "Electronics", "Food", "Healthcare", "Hiking", "Kitchen", "Recreational", "Sport", "Toiletries", "Work"]

  validates :category, inclusion: { in: CATEGORIES }
end
