require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "#title" do
    it 'validates presence' do
      book = Book.new
      book.validate
      expect(book.errors[:title]).to include("can't be blank")

      book.title = "Chuck, the Great"
      book.validate
      expect(book.errors[:title]).to_not include("can't be blank")
    end
  end

  describe "#number_of_pages" do
    it 'validates presence' do
      book = Book.new
      book.validate
      expect(book.errors[:number_of_pages]).to include("can't be blank")

      book.number_of_pages = "123"
      book.validate
      expect(book.errors[:number_of_pages]).to_not include("can't be blank")
    end
  end

  describe "#blurb" do
    it 'validates presence' do
      book = Book.new
      book.validate
      expect(book.errors[:blurb]).to include("can't be blank")

      book.blurb = "The saga of an incredible cat"
      book.validate
      expect(book.errors[:blurb]).to_not include("can't be blank")
    end
  end
end
