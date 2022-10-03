require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#first_name" do
    it 'validates presence' do
      user = User.new(email: "user@user.fr", password: "12345", last_name: "the-cat")
      user.validate
      expect(user.errors[:first_name]).to include("can't be blank")

      user.first_name = "chuck"
      user.validate
      expect(user.errors[:first_name]).to_not include("can't be blank")
    end
  end

  describe "#last_name" do
    it 'validates presence' do
      user = User.new(email: "user@user.fr", password: "12345", first_name: "chuck")
      user.validate
      expect(user.errors[:last_name]).to include("can't be blank")

      user.last_name = "the-cat"
      user.validate
      expect(user.errors[:last_name]).to_not include("can't be blank")
    end
  end

  describe "#email" do
    it 'validates presence' do
      user = User.new(password: "12345", first_name: "chuck", last_name: "the-cat")
      user.validate
      expect(user.errors[:email]).to include("can't be blank")

      user.email = "the-cat"
      user.validate
      expect(user.errors[:email]).to_not include("can't be blank")
    end
  end

  describe "#full_name" do
    it "returns capitalised full name" do
      test_user = User.new(first_name: "chuck", last_name: "the-cat", email: "chuck@catmail.fr", password: "123456")
      expect(test_user.full_name).to eq("Chuck The-cat")
    end
  end
end
