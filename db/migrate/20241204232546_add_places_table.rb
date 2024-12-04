class AddPlacesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :places, id: :uuid do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false

      # Timestamps add created_at and updated_at
      t.timestamps
    end
  end
end
