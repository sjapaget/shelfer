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

  describe "POST /create" do
    let(:valid_attributes) { { title: "Just a test", number_of_pages: 42, blurb: "A book for tests" } }
    let(:invalid_attributes) { { invalid_title: "Just a test", invalid_number_of_pages: 42, invalid_blurb: "A book for tests" } }

    context 'with valid parameters' do
      it 'creates a new book' do
        expect {
          post api_v1_books_path, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post api_v1_books_path, params: { book: valid_attributes }
        expect(response).to redirect_to(api_v1_book_path(Book.last))
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new book" do
        expect {
          post api_v1_books_path, params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:book_to_delete) { create(:book, user: user) }
    let(:alt_user) { create(:user, :alt) }
    let!(:permission_denied_book) { create(:book, user: alt_user) }

    context "when the book belongs to the user" do
      it "destroys the book" do
        expect { delete api_v1_book_path(book_to_delete) }.to change(Book, :count).by(-1)
      end

      it "returns a confirmation of success" do
        expect(response).to be_successful
      end
    end

    context "when the user doesn't have permission to destory the book" do
      it "does not destroy the book" do
        expect { delete api_v1_book_path(permission_denied_book) }.to change(Book, :count).by(0)
      end

      it "returns a permission denied message" do
        expect(response).to be_forbidden
        # expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
