FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name  { "profile" }
    email { 'rspec@test.fr' }
    password { 'password' }
  end

  trait :alt do
    first_name { "alt" }
    last_name  { "profile" }
    email { 'alt@test.fr' }
    password { 'password' }
  end
end
