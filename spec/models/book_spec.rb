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

  describe '#contributors' do
    let(:book)                { create(:book) }
    let(:book_author)         { create(:contributor) }
    let(:book_editor)         { create(:contributor, :alt_name, user: create(:user, :alt)) }
    let!(:contribution)       { create(:contribution, :author, contributor: book_author, book: book) }
    let!(:other_contribution) { create(:contribution, :editor, contributor: book_editor, book: book) }

    it "Returns the roles and names of all the books contributors" do
      contribs = [
        { role: contribution.role, name: book_author.name },
        { role: other_contribution.role, name: book_editor.name }
      ]

      expect(book.contributors).to contain_exactly(contribs[0], contribs[1])
    end
  end

  describe '#authors' do
    let(:alt_user)             { create(:user, :alt) }
    let(:single_author_book)   { build(:book) }
    let(:multi_authors_book)   { build(:book) }
    let(:author_one)           { build(:contributor, user: alt_user) }
    let(:author_two)           { build(:contributor, :alt_name, user: alt_user) }
    let(:translator)           { build(:contributor, name: 'Tina the Translator', user: alt_user) }
    let!(:contribution_1)      { create(:contribution, :author, contributor: author_one, book: single_author_book) }
    let!(:contribution_2a)     { create(:contribution, :author, contributor: author_one, book: multi_authors_book) }
    let!(:contribution_2b)     { create(:contribution, :author, contributor: author_two, book: multi_authors_book) }
    let!(:contribution_trans)  { create(:contribution, :translator, contributor: translator, book: single_author_book) }

    it 'Returns the roles and names of all the books authors' do
      book_author = single_author_book.authors
      expect(book_author).to include({ role: contribution_1.role, name: author_one.name })

      contribs = [
        { role: contribution_2a.role, name: author_one.name },
        { role: contribution_2b.role, name: author_two.name }
      ]
      multi_book_authors = multi_authors_book.authors
      expect(multi_book_authors).to contain_exactly(contribs[0], contribs[1])
    end

    it "doesn't return non-author contributors" do
      book_author = single_author_book.authors
      expect(book_author).not_to include({ role: contribution_trans.role, name: translator.name })
    end
  end
end
