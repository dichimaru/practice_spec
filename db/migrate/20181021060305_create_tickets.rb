class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :fare
      t.integer :entered_gate_id
      t.integer :exited_gate_id

      t.timestamps
    end
  end
end
