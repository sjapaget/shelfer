FactoryBot.define do
  factory :contribution do
    role { 'author' }
    association :book
    association :contributor
  end

  trait :author do
    role { 'author' }
  end

  trait :translator do
    role { 'translator' }
  end

  trait :editor do
    role { 'editor' }
  end
end
