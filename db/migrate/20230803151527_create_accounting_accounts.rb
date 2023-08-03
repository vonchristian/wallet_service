class CreateAccountingAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounting_accounts, id: :uuid do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.boolean :contra, default: false
      t.string :account_type
      t.belongs_to :financial_institution, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :accounting_accounts, :account_type
    add_index :accounting_accounts, :contra

  end
end
