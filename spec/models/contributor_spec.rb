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
