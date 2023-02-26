require 'rails_helper'

RSpec.describe "Shelves", type: :request do
  let(:user) { create(:user) }
  let!(:shelf) { create(:shelf, user: user) }
  let!(:another_shelf) { create(:shelf, user: user, name: 'another shelf') }
  let(:other_user) { create(:user, :alt) }
  let!(:unauthorised_shelf) { create(:shelf, user: other_user, name: 'unauthorised shelf') }

  before do
    sign_in user
  end

  describe "GET /index" do
    before do
      get api_v1_shelves_path
    end

    it 'response is successful' do
      expect(response).to be_successful
    end

    it "returns the details for all the current user's shelves" do
      expect(response.body).to include(shelf.name, another_shelf.name)
    end

    it "doesn't return details of other user's shelves" do
      expect(response.body).not_to include(unauthorised_shelf.name)
    end
  end

  describe 'GET /show' do
    before do
      get api_v1_shelf_path(shelf)
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "includes the shelf's details" do
      expect(response.body).to include(shelf.name)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { { name: 'My favourites', description: 'the best ones', user_id: user.id } }
    let(:invalid_attributes) { { invalid_name: 'My favourites', invalid_description: 'the best ones', invalid_user_id: user.id } }

    context 'with valid parameters' do
      it 'creates a new shelf' do
        expect {
          post api_v1_shelves_path, params: { shelf: valid_attributes }
        }.to change(Shelf, :count).by(1)
      end

      it 'redirects to the created shelf' do
        post api_v1_shelves_path, params: { shelf: valid_attributes }
        expect(response).to redirect_to(api_v1_shelf_path(Shelf.last))
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new shelf" do
        expect {
          post api_v1_shelves_path, params: { shelf: invalid_attributes }
        }.to change(Shelf, :count).by(0)
      end

      it 'responds with status 422 - unprocessable entity' do
        post api_v1_shelves_path, params: { shelf: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:shelf_to_delete) { create(:shelf, name: 'delete-able', user: user) }
    let(:alt_user) { create(:user, :alt, email: 'alt@destroy-shelf.fr') }
    let!(:permission_denied_shelf) { create(:shelf, name: 'forbidden', user: alt_user) }

    context 'when the shelf belongs to the user' do
      it 'destroys the shelf' do
        expect { delete api_v1_shelf_path(shelf_to_delete) }.to change(Shelf, :count).by(-1)
      end
    end

    context "when the shelf does not belong to the user" do
      it 'does not destroy the shelf' do
        expect { delete api_v1_shelf_path(permission_denied_shelf) }.to change(Shelf, :count).by(0)
      end

      it 'response has status 403 - forbidden' do
        delete api_v1_shelf_path(permission_denied_shelf)
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
