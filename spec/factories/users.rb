FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "tttttt" }
    password_confirmation { "tttttt" }
  end
end
