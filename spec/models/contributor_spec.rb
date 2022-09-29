require 'rails_helper'

RSpec.describe Contributor, type: :model do
  # setup - create a user for the contributor to belong to
  test_user = User.new(first_name: "chuck", last_name: "the-cat", email: "chuck-the-cat@cats.fr", password: "123456")

  describe "#name" do
    it 'validates presence' do
      contributor = Contributor.new
      contributor.user = test_user
      contributor.validate
      expect(contributor.errors[:name]).to include("can't be blank")

      contributor.name = "Chuck The-cat"
      contributor.validate
      expect(contributor.errors[:name]).to_not include("can't be blank")
    end

    it "must be unique" do
      # create a user in the db so that the name is already taken
      Contributor.create!(name: "chuck the-cat", user: test_user)

      duplicate_contributor = Contributor.new
      duplicate_contributor.user = test_user
      duplicate_contributor.name = "chuck the-cat"
      duplicate_contributor.validate
      expect(duplicate_contributor.errors[:name]).to include("has already been taken")

      duplicate_contributor.name = "Archie the-dog"
      duplicate_contributor.validate
      expect(duplicate_contributor.errors[:name]).to_not include("has already been taken")
    end
  end

  describe "#user" do
    it 'validates presence' do
      contributor = Contributor.new
      contributor.name = "Chuck The-cat"
      contributor.validate
      expect(contributor.errors[:user]).to include("can't be blank")

      contributor.user = test_user
      contributor.validate
      expect(contributor.errors[:user]).to_not include("can't be blank")
    end
  end
end
