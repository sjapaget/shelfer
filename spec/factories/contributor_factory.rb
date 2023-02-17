FactoryBot.define do
  factory :contributor do
    name { 'Test Contributor' }
    association :user
  end

  trait :alt_name do
    name { 'An Alternative Test Contributor' }
  end
end
