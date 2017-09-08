require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

    test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        username:  "Example User",
        email: "user@example.com",
        password:              "password",
        password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template '/'
    assert is_logged_in?
    end

end
