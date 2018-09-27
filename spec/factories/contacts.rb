FactoryBot.define do
  factory :contact do
    name 'John Doe'
    email 'contact@domain.com'
    notes 'MyText'
    user
  end
end
