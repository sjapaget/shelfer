require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#long?' do
    let(:short_book) { build(:book) }

    it 'returns a boolean' do
      expect(short_book.long?).to be_a(FalseClass || TrueClass)
    end

    context 'when the book has less than 500 pages' do
      it 'returns false' do
        expect(short_book.long?).to be(false)
      end
    end

    context 'when the book has over 500 pages' do
      let(:long_book) { build(:book, :long) }
      it "returns true" do
        expect(long_book.long?).to be(true)
      end
    end
  end
end
