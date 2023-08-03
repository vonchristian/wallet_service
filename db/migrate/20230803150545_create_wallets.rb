class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.string :account_number, null: false
      t.string :account_name, null: false

      t.timestamps
    end
    add_index :wallets, :account_number, unique: true
  end
end
