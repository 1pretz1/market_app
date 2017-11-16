require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should show new user view" do
    get '/users/new'
    assert_response :success
  end

end
