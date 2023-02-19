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
    let(:book) { create(:book) }
    let(:book_author) { create(:contributor) }
    let(:book_editor) { create(:contributor, :alt_name, user: create(:user, :alt)) }
    let!(:contribution) { create(:contribution, :author, contributor: book_author, book: book) }
    let!(:other_contribution) { create(:contribution, :editor, contributor: book_editor, book: book) }

    it "Returns the roles and names of all the books contributors" do
      contribs = { contribution.role => book_author.name, other_contribution.role => book_editor.name }
      p book.contributors
      expect(book.contributors).to include(contribs)
    end
  end

  describe '#authors' do
    let(:single_author_book) { build(:book) }
    let(:multi_authors_book) { build(:book) }
    let(:author_one) { build(:contributor) }
    let(:author_two) { build(:contributor, :alt_name) }
    let(:translator) { build(:contributor, name: 'Tina the Translator') }
    let(:contribution_one) { build(:contribution, :author) }
    let(:contribution_two_a) { build(:contribution, :author) }
    let(:contribution_two_b) { build(:contribution, :author) }
    let(:contribution_translator) { build(:contribution, :translator) }
    let(:alt_user) { build(:user, :alt) }

    before do
      contribution_one.book = single_author_book
      contribution_one.contributor = author_one
      contribution_one.save!

      contribution_translator.book = single_author_book
      translator.user = alt_user
      contribution_translator.contributor = translator
      contribution_translator.save!

      contribution_two_a.contributor = author_one
      contribution_two_a.book = multi_authors_book
      contribution_two_a.save!

      author_two.user = alt_user
      contribution_two_b.contributor = author_two
      contribution_two_b.book = multi_authors_book
      contribution_two_b.save!
    end

    it 'lists all the authors' do
      book_author = single_author_book.authors
      expect(book_author.count).to eq(1)
      expect(book_author).to include(author_one)

      multi_book_authors = multi_authors_book.authors
      expect(multi_book_authors.count).to be > 1
      expect(multi_book_authors).to include(author_one, author_two)
    end

    it "doesn't return non-author contributors" do
      book_author = single_author_book.authors
      expect(book_author).not_to include(translator)
    end
  end
end
