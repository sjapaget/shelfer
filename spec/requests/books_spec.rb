require 'rails_helper'

RSpec.describe "/api/v1/books", type: :request do
  let(:user) { create(:user) }
  let!(:book) { create(:book) }
  describe "GET /index" do
    before do
      sign_in user
      get api_v1_books_path
    end

    it "renders a successful resonse" do
      expect(response).to be_successful
    end
    it "includes the details of all existing books" do
      expect(response.body).to include(book.title)
    end
  end

  describe "GET /show" do
    before do
      sign_in user
      get api_v1_book_path(book)
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end
  end
end
