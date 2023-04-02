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
      let(:user) { create(:user, :alt) }
      let(:shelf) { create(:shelf, user: user) }
      let(:book_one) { create(:book, title: 'Book One', user: user) }
      let(:book_two) { create(:book, title: 'Book Two', user: user) }

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

  describe '#books' do
    let!(:this_user) { create(:user, email: "alt-for-#books@email-example.fr") }
    let(:book) { create(:book, user: this_user) }
    let(:contributor) { create(:contributor, user: this_user) }
    let!(:contribution) { create(:contribution, book: book, contributor: contributor) }
    let(:shelf) { create(:shelf, user: this_user) }
    let!(:placement) { create(:placement, shelf: shelf, book: book) }

    it 'returns the book title and contributor names & roles for all its placements' do
      result = shelf.books
      expect(result).to include({ placement_id: placement.id, book_id: book.id, title: book.title, contributors: book.contributors })
    end
  end
end
