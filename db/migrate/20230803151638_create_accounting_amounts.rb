class CreateAccountingAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounting_amounts, id: :uuid do |t|
      t.belongs_to :account, null: false, foreign_key: { to_table: :accounting_accounts }, type: :uuid
      t.belongs_to :entry, null: false, foreign_key: { to_table: :accounting_entries }, type: :uuid
      t.integer :amount_cents, limit: 8
      t.string :amount_type, null: false

      t.timestamps
    end

    add_index :accounting_amounts, :amount_type
    add_index :accounting_amounts, [:entry_id, :account_id]
    add_index :accounting_amounts, [:account_id, :entry_id]
  end
end
