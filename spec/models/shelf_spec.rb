# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Shelf, type: :model do
  describe '#titles' do
    context "when shelf empty" do
      let(:empty_shelf) { build(:shelf) }
      
      it "returns a 'shelf empty' message" do
        message = empty_shelf.titles
        expect(message).to be_a(String)
        expect(message).to eq('Shelf empty')
      end
    end

    context 'when shelf has placements' do
      let(:shelf) { create(:shelf) }
      let(:book_one) { create(:book, title: 'Book One') }
      let(:book_two) { create(:book, title: 'Book Two') }

      before do
        create(:placement, book: book_one, shelf: shelf)
        create(:placement, book: book_two, shelf: shelf)
      end

      it "returns the titles of all the placements" do
        titles = shelf.titles
        expect(titles.length).to eq(2)
        expect(titles).to include(book_one.title)
        expect(titles).to include(book_two.title)
      end
    end
  end
end
