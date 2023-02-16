FactoryBot.define do
  factory :contribution do
    book
    contributor
    role { 'author' }
  end
end
