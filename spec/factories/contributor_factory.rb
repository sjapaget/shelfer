FactoryBot.define do
  factory :contributor do
    name { 'Test Contributor' }
    user
  end

  trait :alt_name do
    name { 'An Alternative Test Contributor' }
  end
end
