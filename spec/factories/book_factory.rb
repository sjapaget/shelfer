FactoryBot.define do
  factory :book do
    title { 'The book of Testing' }
    blurb { 'Everything you need to run your tests, and nothing more.' }
    number_of_pages { 256 }
  end

  trait :long do
    number_of_pages { 700 }
  end
end
