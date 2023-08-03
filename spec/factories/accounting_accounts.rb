FactoryBot.define do
  factory :accounting_account do
    name { "MyString" }
    code { "MyString" }
    contra { false }
    account_type { "MyString" }
    financial_institution { nil }
  end
end
