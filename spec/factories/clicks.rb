FactoryBot.define do
  factory :click do
    link { nil }
    user_agent { "MyString" }
    device_type { "MyString" }
    country { "MyString" }
    city { "MyString" }
    clicked_at { "2023-12-22 21:06:27" }
  end
end
