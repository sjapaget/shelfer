require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user, first_name: 'Chuck', last_name: 'The-cat') }
  describe "#full_name" do
    it "returns capitalised full name" do
      expect(user.full_name).to eq("Chuck The-cat")
    end
  end

  describe "#reset_auth_token" do
    before do
      user.save!
    end
    it "resets the users auth_token" do
      old_token = user.authentication_token
      user.reset_auth_token
      new_token = user.authentication_token

      expect(old_token).not_to eq(new_token)
    end
  end
end
