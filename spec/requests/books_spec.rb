require 'rails_helper'

RSpec.describe "/api/v1/books", type: :request do
  let(:user) { create(:user) }
  let!(:book) { create(:book) }
  let!(:another_book) { create(:book) }
  before do
    sign_in user
  end
  describe "GET /index" do
    before do
      get api_v1_books_path
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end
    it "includes the details of all existing books" do
      expect(response.body).to include(book.title, another_book.title)
    end
  end

  describe "GET /show" do
    before do
      get api_v1_book_path(book)
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "includes the books details" do
      expect(response.body).to include(book.title)
    end
  end
end
