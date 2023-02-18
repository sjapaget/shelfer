require 'rails_helper'

RSpec.describe Contributor, type: :model do
  describe "#role" do
    let(:book) { build(:book) }
    let(:contributor) { build(:contributor) }
    let!(:contribution) { create(:contribution, book: book, contributor: contributor) }
    it "returns the role of the contributor for a given book" do
      result = contributor.role(book)
      expect(result).to contain_exactly('author')
    end

    context "when a contributor has multiple roles for the same book" do
      let!(:editor_contribution) { create(:contribution, :editor, book: book, contributor: contributor) }
      it "returns all the roles" do
        result = contributor.role(book)
        expect(result).to contain_exactly('author', 'editor')
      end
    end
  end
end
