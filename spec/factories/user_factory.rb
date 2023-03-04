FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.fr"
  end


  factory :user do
    first_name { "test" }
    last_name  { "profile" }
    email { generate :email }
    password { 'password' }
  end

  trait :alt do
    first_name { "alt" }
    last_name  { "profile" }
    email { 'alt@test.fr' }
    password { 'password' }
  end
end
