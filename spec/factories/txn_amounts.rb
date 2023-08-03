FactoryBot.define do
  factory :txn_amount do
    txn { nil }
    amount_type { "MyString" }
    amount_cents { 1 }
    account { nil }
  end
end
