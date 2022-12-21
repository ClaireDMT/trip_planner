class CreateTransits < ActiveRecord::Migration[7.0]
  def change
    create_table :transits do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :transport_type
      t.string :from
      t.string :to
      t.boolean :paid, default: false
      t.references :trip, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
