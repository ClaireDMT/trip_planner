class AddPriceToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_monetize :expenses, :price, currency: { present: false }
    add_monetize :places, :price, currency: { present: false }
    add_monetize :lodgings, :price, currency: { present: false }
    add_monetize :lodgings, :price_per_night, currency: { present: false }
    add_monetize :rentals, :price, currency: { present: false }
    add_monetize :transits, :price, currency: { present: false }
  end
end
