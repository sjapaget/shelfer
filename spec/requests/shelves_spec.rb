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
end
