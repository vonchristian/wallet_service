class CreateTxnAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :txn_amounts, id: :uuid do |t|
      t.belongs_to :txn, null: false, foreign_key: true, type: :uuid
      t.string :amount_type, null: false
      t.integer :amount_cents, limit: 8
      t.belongs_to :account, null: false, foreign_key: { to_table: :accounting_accounts }, type: :uuid

      t.timestamps
    end
    add_index :txn_amounts, :amount_type

  end
end
