require 'rails_helper'

RSpec.describe Contribution, type: :model do
  let(:contribution) { build(:contribution, :author) }
  let(:book) { build(:book) }
  let(:contributor) { build(:contributor) }

  describe "#unique_combination_of_book_contributor_and_role" do
    context "when combo of book, contributor & role already exists" do
      let(:existing_contribution) { build(:contribution, :author) }
      before do
        existing_contribution.book = book
        existing_contribution.contributor = contributor
        existing_contribution.save!

        contribution.book = book
        contribution.contributor = contributor
      end

      it "returns validation error" do
        contribution.validate
        expect(contribution.errors[:contributor]).to include("this contribution already exists")
      end
    end

    context "when combo of book, role & contributor is unique" do
      let(:unique_role_one) { build(:contribution, :author) }
      let(:unique_role_two) { build(:contribution, :translator) }
      let(:alt_book) { build(:book, :alt_book) }
      let(:unique_book_one) { build(:contribution) }
      let(:unique_book_two) { build(:contribution) }
      let(:alt_contributor) { build(:contributor, :alt_name) }
      let(:unique_contributor_one) { build(:contribution) }
      let(:unique_contributor_two) { build(:contribution) }

      it "allows different roles with identical books & contributors" do
        unique_role_one.book = book
        unique_role_one.contributor = contributor
        unique_role_one.save!
        unique_role_two.book = book
        unique_role_two.contributor = contributor

        unique_role_two.validate
        expect(unique_role_two.errors[:contributor]).not_to include("this contribution already exists")
      end

      it "allows different books with identical roles & contributors" do
        unique_book_one.book = book
        unique_book_one.contributor = contributor
        unique_book_one.save!
        unique_book_two.book = alt_book
        unique_book_two.contributor = contributor

        unique_book_two.validate
        expect(unique_book_two.errors[:contributor]).not_to include("this contribution already exists")
      end

      it "allows different contributors with identical books & roles" do
        unique_contributor_one.book = book
        unique_contributor_one.contributor = contributor
        unique_contributor_one.save!
        unique_contributor_two.book = book
        unique_contributor_two.contributor = alt_contributor

        unique_contributor_two.validate
        expect(unique_contributor_two.errors[:contributor]).not_to include("this contribution already exists")
      end
    end
  end
end
