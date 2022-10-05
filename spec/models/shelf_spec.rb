require 'rails_helper'

RSpec.describe Shelf, type: :model do
  # setup - create a user for the shelf to belong to
  test_user = User.new(first_name: "chuck", last_name: "the-cat", email: "chuck-the-cat@cats.fr", password: "123456")

  describe "#name" do
    it 'validates presence' do
      shelf = Shelf.new
      shelf.validate
      expect(shelf.errors[:name]).to include("can't be blank")

      shelf.name = "Cats"
      shelf.validate
      expect(shelf.errors[:name]).to_not include("can't be blank")
    end

    it "must be unique" do
      Shelf.create!(name: "Cats", description: "All the books on cats in this shelf", user: test_user)

      duplicate_shelf = Shelf.new
      duplicate_shelf.name = "Cats"
      duplicate_shelf.user = test_user
      duplicate_shelf.validate
      expect(duplicate_shelf.errors[:name]).to include("has already been taken")

      duplicate_shelf.name = "Dogs"
      duplicate_shelf.validate
      expect(duplicate_shelf.errors[:name]).to_not include("has already been taken")
    end
  end

  describe "#description" do
    it 'validates presence' do
      shelf = Shelf.new
      shelf.validate
      expect(shelf.errors[:description]).to include("can't be blank")

      shelf.description = "All the books on cats in this shelf"
      shelf.validate
      expect(shelf.errors[:description]).to_not include("can't be blank")
    end
  end
end
