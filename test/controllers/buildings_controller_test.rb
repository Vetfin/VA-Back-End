require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buildings_url
    assert_response :success
  end

end
