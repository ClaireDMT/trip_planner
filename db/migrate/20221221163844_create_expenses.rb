class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :transit, null: false, foreign_key: true
      t.references :lodging, null: false, foreign_key: true
      t.references :rental, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.datetime :date
      t.integer :split
      t.string :comment

      t.timestamps
    end
  end
end
