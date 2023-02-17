require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user, first_name: 'Chuck', last_name: 'The-cat') }
  describe "#full_name" do
    it "returns capitalised full name" do
      expect(user.full_name).to eq("Chuck The-cat")
    end
  end
end
