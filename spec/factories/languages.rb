FactoryBot.define do
  factory :language do
    sequence(:name) { |n| "MyString#{n}" }
    file_share_folder { "MyString" }
  end
end
