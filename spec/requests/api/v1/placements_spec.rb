require 'rails_helper'

RSpec.describe "Api::V1::Placements", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end
  
  describe "POST /create" do
    let(:book) { create(:book, user: user) }
    let(:shelf) { create(:shelf, user: user) }
    let(:valid_attributes) { { book_id: book.id, shelf_id: shelf.id } }
    let(:invalid_attributes) { { book_id: 'NaN', shelf_id: 'null' } }

    context 'with valid parameters' do
      it 'creates a new placemet' do
        expect {
          post api_v1_placements_path, params: { placement: valid_attributes }
        }.to change(Placement, :count).by(1)
      end

      it "redirects to the shelf index of the created placement" do
        post api_v1_placements_path, params: { placement: valid_attributes }
        expect(response).to redirect_to(api_v1_shelves_path(Placement.last.shelf))
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new placement" do
        expect {
          post api_v1_placements_path, params: { placement: invalid_attributes }
        }.to change(Placement, :count).by(0)
      end

      it 'responds with status 422 - unprocessable entity' do
        post api_v1_placements_path, params: { placement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
