require 'test_helper'

class CondosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get condos_url
    assert_response :success
  end

  test "should be able to search" do
    get search_condos_url, params: {min_price: 100, max_price: nil}
    # assert_equal [], assigns(:condos)
  end

end
