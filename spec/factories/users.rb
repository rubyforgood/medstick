FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "email_address#{n}" }
    password { "password" }

    trait :admin do
      is_admin { true }
    end
  end
end
