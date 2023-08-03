class AccountingAmount < ApplicationRecord
  belongs_to :account
  belongs_to :entry
end
