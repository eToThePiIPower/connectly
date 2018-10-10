FactoryBot.define do
  factory :contact do
    name 'John Doe'
    email 'contact@domain.com'
    notes 'MyText'
    user

    factory :contact_with_addresses do
      transient do
        addresses_count { 2 }
      end

      after(:create) do |contact, evaluator|
        create_list(:address, evaluator.addresses_count, addressable: contact)
      end
    end
  end
end
