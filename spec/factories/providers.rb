FactoryBot.define do
  factory :provider do
    sequence(:name) { |n| "MyString#{n}" }
    provider_type { "MyString" }
  end
end
