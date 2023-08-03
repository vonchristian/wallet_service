class TxnAmount < ApplicationRecord
  belongs_to :txn
  belongs_to :account
end
