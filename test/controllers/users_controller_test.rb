require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can create user" do
    post users_url, user: { first_name: "Erik", last_name: "Douglas", email: "erik@erik"}
    assert_response :success
  end


end
