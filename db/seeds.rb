puts "Seed Started"

puts "Destroying previous data"

Contribution.destroy_all
Contributor.destroy_all
Placement.destroy_all
Shelf.destroy_all
User.destroy_all
Book.destroy_all

puts "Previous Data destroyed successfully"


puts "Creating Users"

puts "Making test profile"
User.create!(
  first_name: "test1",
  last_name: "profile",
  email: "test1@test.fr",
  password:"123456"
)
puts "Test profile created"

puts "Making random user"
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  )
end
puts "Random users made"

puts "#{User.all.length} users created successfully"

puts "Creating shelves"

User.all.each do |user|
  nb_of_shelves = rand(1..10)

  nb_of_shelves.times do
    Shelf.create!(
      user: user,
      name: Faker::Lorem.unique.word,
      description: Faker::Quotes::Shakespeare.king_richard_iii_quote
    )
  end
end

puts "#{Shelf.all.length} shelves created successfully"

puts "Creating books, contributors and contributions"

50.times do
  book = Book.create!(
    title: Faker::Book.unique.title,
    number_of_pages: rand(25..1000),
    blurb: Faker::Lorem.paragraph
  )

  contributor = Contributor.create!(
    user: User.all.sample,
    name: Faker::Book.unique.author
  )

  Contribution.create!(
    book: book,
    contributor: contributor,
    role: "author"
  )

  additional_contributor_chance = rand

  if additional_contributor_chance > 0.5
    additional_contributor = Contributor.create!(
      user: User.all.sample,
      name: Faker::Book.unique.author
    )

    Contribution.create!(
      book: book,
      contributor: additional_contributor,
      role: ['editor', 'author', 'translator'].sample()
    )
  end
end

puts "#{Book.all.length} books, #{Contributor.all.length} contributors, and #{Contribution.all.length} contributions created successfully"

puts "Creating placements"

Shelf.all.each do |shelf|
  nb_of_books = rand(1..50)
  shelf_books = Book.all.sample(nb_of_books)
  shelf_books.each do |book|
    Placement.create!(
      book: book,
      shelf: shelf
    )
  end
end

puts "#{Placement.all.length} placements created successfully"

puts "Seed finished successfully"
