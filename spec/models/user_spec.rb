require 'rails_helper'

RSpec.describe User, type: :model do
  context "to be valid" do
    it "must have a first_name" do
      test_user = User.new(last_name: "the-cat", email: "chuck-the-cat@cats.fr", password: "123456")
      expect { User.create!(test_user).to raise_error(ActiveRecord::RecordInvalid) }
    end

    it "must have a last_name" do
      test_user = User.new(first__name: "chuck", email: "chuck-the-cat@cats.fr", password: "123456")
      expect { User.create!(test_user).to raise_error(ActiveRecord::RecordInvalid) }
    end

    it "must have an email" do
      test_user = User.new(first__name: "chuck", last_name: "the-cat", password: "123456")
      expect { User.create!(test_user).to raise_error(ActiveRecord::RecordInvalid) }
    end

    it "must have a password" do
      test_user = User.new(first__name: "chuck", email: "chuck-the-cat@cats.fr", email: "chuck-the-cat@cats.fr")
      expect { User.create!(test_user).to raise_error(ActiveRecord::RecordInvalid) }
    end
end
