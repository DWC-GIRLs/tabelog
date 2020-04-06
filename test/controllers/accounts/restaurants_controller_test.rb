require 'test_helper'

class Accounts::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get accounts_restaurants_show_url
    assert_response :success
  end

  test "should get index" do
    get accounts_restaurants_index_url
    assert_response :success
  end

end
