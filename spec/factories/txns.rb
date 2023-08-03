FactoryBot.define do
  factory :txn do
    reference_number { "MyString" }
    description { "MyString" }
    entry_date { "2023-08-03" }
    entry_time { "2023-08-03 23:20:47" }
  end
end
