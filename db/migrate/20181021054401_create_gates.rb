class CreateGates < ActiveRecord::Migration[5.2]
  def change
    create_table :gates do |t|
      t.string :name
      t.integer :station_number

      t.timestamps
    end
  end
end
