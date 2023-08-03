class CreateTxns < ActiveRecord::Migration[7.0]
  def change
    create_table :txns, id: :uuid do |t|
      t.string :reference_number, null: false
      t.string :description, null: false
      t.date :entry_date, null: false
      t.time :entry_time, null: false

      t.timestamps
    end

    add_index :txns, :entry_date
    add_index :txns, :entry_time
  end
end
