
module Personal
  class PersonalWallet < ApplicationRecord
    belongs_to :person
    belongs_to :wallet
    belongs_to :issuer, class_name: 'FinancialInstitution', foreign_key: 'issuer_id'
  end
end