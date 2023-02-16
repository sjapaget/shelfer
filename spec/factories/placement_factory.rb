FactoryBot.define do
  factory :placement do
    association :book
    association :shelf
  end
end
