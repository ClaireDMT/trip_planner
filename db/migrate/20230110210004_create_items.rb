class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.references :user, null: true, foreign_key: true
      t.boolean :packed, default: false
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
