FactoryBot.define do
  factory :accounting_amount do
    account { nil }
    entry { nil }
    amount_cents { 1 }
    amount_type { "MyString" }
  end
end
