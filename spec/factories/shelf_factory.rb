FactoryBot.define do
  factory :shelf do
    name { 'My Test Shelf' }
    description { 'A lovely shelf for Tests' }
    user
  end
end
