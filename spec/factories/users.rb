FactoryBot.define do
  factory :user do
    email_address { "email_address" }
    password { "password" }

    trait :admin do
      is_admin { true }
    end
  end
end
