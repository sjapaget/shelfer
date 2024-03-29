FactoryBot.define do
  factory :book do
    title { 'The book of Testing' }
    blurb { 'Everything you need to run your tests, and nothing more.' }
    number_of_pages { 256 }
    user
  end

  trait :long do
    number_of_pages { 700 }
  end

  trait :alt_book do
    title { 'The Book of Testing: Vol. 2' }
    blurb { "Ok, so the first book didn't quite have it all..." }
    number_of_pages { 15 }
  end

  trait :with_contributor do
    association :contributions, factory: :contribution
    after(:build) do |book|
      build(:user, email: 'for-contribs@factory.fr')
      build(:contributor, user: user)
      build(:contribution, book_id: book.id, contributor_id: contributor.id)
    end
  end
end
