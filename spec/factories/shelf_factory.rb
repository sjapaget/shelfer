FactoryBot.define do
  factory :shelf do
    name { 'My Test Shelf' }
    description { 'A lovely shelf for Tests' }
    user

    trait :with_placement do
      association :placements, factory: :placement
      after(:build) do |shelf|
        build(:book)
        build(:placement, shelf_id: shelf.id, book_id: book.id)
      end
    end

  end
end
