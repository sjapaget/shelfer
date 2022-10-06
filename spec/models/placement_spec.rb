require 'rails_helper'

RSpec.describe Placement, type: :model do
  test_user = User.create!(
    first_name: "chuck",
    last_name: "cattington",
    password: "123456",
    email: "chuck-cattington@catmail.fr"
  )
  test_book = Book.create!(
    title: "The Adventures of Chuckleberry Purr",
    number_of_pages: "222",
    blurb: "A classic of Cat literature"
  )
  alt_test_book = Book.create!(
    title: "The Picture of Chuck Ginger",
    number_of_pages: "222",
    blurb: "Is there something a little strange about that portrait of Chuck in the attic?"
  )
  test_shelf = Shelf.create!(
    user: test_user,
    name: "Classics",
    description: "A collection of Classics I'd like to read"
  )

  describe "#book" do
    it "validates presence" do
      placement = Placement.new
      placement.shelf = test_shelf
      placement.validate
      expect(placement.errors[:book]).to include("can't be blank")

      placement.book = test_book
      placement.validate
      expect(placement.errors[:book]).to_not include("can't be blank")
    end
  end

  describe "#shelf" do
    it "validates presence" do
      placement = Placement.new
      placement.book = test_book
      placement.validate
      expect(placement.errors[:shelf]).to include("can't be blank")

      placement.shelf = test_shelf
      placement.validate
      expect(placement.errors[:shelf]).to_not include("can't be blank")
    end
  end

  # test_book.destroy
  alt_test_book.destroy
  test_shelf.destroy
  test_user.destroy
end
