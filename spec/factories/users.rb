FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    email { "#{username}@example.com" }
    password 'password'
  end
end
