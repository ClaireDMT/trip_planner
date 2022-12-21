class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :paid, default: false
      t.references :trip, null: false, foreign_key: true
      t.integer :status
      t.string :comment

      t.timestamps
    end
  end
end
