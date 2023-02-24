require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }
    let!(:book) { create(:book) }
    before do
      sign_in user
    end

    it "displays all the books" do
      get api_v1_books_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(book.title)
    end
  end
end
