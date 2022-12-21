class CreateLodgings < ActiveRecord::Migration[7.0]
  def change
    create_table :lodgings do |t|
      t.string :name
      t.string :link
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :paid
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
