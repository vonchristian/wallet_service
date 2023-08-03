class AddDepositAccountToWallets < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :deposit_account, null: false, foreign_key: { to_table: :accounting_accounts }, type: :uuid
  end
end
