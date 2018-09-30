FactoryBot.define do
  factory :address do
    association :addressable, factory: :contact
    primary true
    address_type :work
    body { {} }
  end
end
