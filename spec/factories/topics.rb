FactoryBot.define do
  factory :topic do
    sequence(:title) { |n| "MyString#{n}" }
    description { "MyText" }
    uid { "MyString" }
    state { 0 }
    language
    provider
  end
end
