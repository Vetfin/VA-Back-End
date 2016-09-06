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

  test "user can favorite a condo" do
    erik = User.create(first_name: "Erik", last_name: "Dopuglas", email: "erik@abc.com")
    current_user = erik
    condo1 = Condo.create(baths: 2.5)
    post '/condos/#{condo1.id}/favorite'
    assert_includes erik.condos, condo1
  end

end
