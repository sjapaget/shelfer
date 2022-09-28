require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "full_name returns the capitalized first name and last name" do
    user = User.new(first_name: "chuck", last_name: "the-cat")

    assert_equal "Chuck The-cat", user.full_name
  end
end
