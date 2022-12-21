class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :rental_type
      t.boolean :paid, default: false
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :trip, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
