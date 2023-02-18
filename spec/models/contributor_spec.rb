require 'rails_helper'

RSpec.describe Contributor, type: :model do
  describe "#role" do
    let(:book) { build(:book) }
    let(:contributor) { build(:contributor) }
    let(:contribution) { create(:contribution, book: book, contributor: contributor) }
    it "returns the role of the contributor for a given book" do
      result = contributor.role(book)
      expect(result).to eq('author')
    end
  end
end
