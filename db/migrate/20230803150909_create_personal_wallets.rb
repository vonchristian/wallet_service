class CreatePersonalWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_wallets, id: :uuid do |t|
      t.belongs_to :person, null: false, foreign_key: true, type: :uuid
      t.belongs_to :wallet, null: false, foreign_key: true, type: :uuid
      t.belongs_to :issuer, null: false, foreign_key: { to_table: :financial_institutions }, type: :uuid

      t.timestamps
    end
  end
end
