require 'rails_helper'

RSpec.describe Contribution, type: :model do
  # test_user = User.all.first
  # test_contributor = Contributor.create!(user: test_user, name: "Chuck The Cat")
  # test_book = Book.create!(title: "The life of a Cat", number_of_pages: 55, blurb: "Chuck gives insights on his life as a cat")

  # describe "#unique_combination_of_book_contributor_and_role" do
  #   it "must validate on uniqueness of the contributor, book, role combination" do
  #     Contribution.create!(contributor: test_contributor, book: test_book, role: Contribution::ROLES[0])

  #     contribution = Contribution.new(contributor: test_contributor, book: test_book, role: Contribution::ROLES[0])
  #     contribution.validate
  #     expect(contribution.errors[:contributor]).to include("this contribution already exists")

  #     contribution.role = Contribution::ROLES[1]
  #     contribution.validate
  #     expect(contribution.errors[:contributor]).to_not include("this contribution already exists")
  #   end
  # end

  # describe "#book" do
  #   it "must be present" do
  #     contribution = Contribution.new
  #     contribution.role = "author"
  #     contribution.contributor = test_contributor
  #     contribution.validate
  #     expect(contribution.errors[:book]).to include("can't be blank")

  #     contribution.book = test_book
  #     contribution.validate
  #     expect(contribution.errors[:name]).to_not include("can't be blank")
  #   end

  #   it "if destroyed, the contribution must also be destroyed" do
  #     Contribution.create!(contributor: test_contributor, book: test_book, role: Contribution::ROLES[0])
  #     expect { test_book.destroy }.to change(Contribution, :count).by(-1)
  #   end
  # end

  # describe "#contributor" do
  #   it "must be present" do
  #     contribution = Contribution.new
  #     contribution.role = "author"
  #     contribution.book = test_book
  #     contribution.validate
  #     expect(contribution.errors[:contributor]).to include("can't be blank")

  #     contribution.contributor = test_contributor
  #     contribution.validate
  #     expect(contribution.errors[:contributor]).to_not include("can't be blank")
  #   end

  #   it "if destroyed, the contribution must also be destroyed" do
  #     Contribution.create!(contributor: test_contributor, book: test_book, role: Contribution::ROLES[0])
  #     expect { test_contributor.destroy }.to change(Contribution, :count).by(-1)
  #   end
  # end

  # describe "#role" do
  #   it "must be present" do
  #     contribution = Contribution.new
  #     contribution.contributor = test_contributor
  #     contribution.book = test_book
  #     contribution.validate
  #     expect(contribution.errors[:role]).to include("can't be blank")

  #     contribution.role = "author"
  #     contribution.validate
  #     expect(contribution.errors[:role]).to_not include("can't be blank")
  #   end

  #   it "must be included in Contribution::ROLES" do
  #     contribution = Contribution.new(contributor: test_contributor, book: test_book)
  #     contribution.role = "invalid role value"
  #     contribution.validate
  #     expect(contribution.errors[:role]).to include("must be included in Contribution::ROLES")

  #     contribution.role = Contribution::ROLES.sample
  #     contribution.validate
  #     expect(contribution.errors[:role]).to_not include("must be included in Contribution::ROLES")
  #   end
  # end

end
