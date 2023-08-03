FactoryBot.define do
  factory :accounting_entry do
    reference_number { "MyString" }
    description { "MyString" }
    entry_date { "2023-08-03" }
    entry_time { "2023-08-03 23:16:10" }
  end
end
