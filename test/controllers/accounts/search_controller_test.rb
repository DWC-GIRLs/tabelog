require 'test_helper'

class Accounts::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get area" do
    get accounts_search_area_url
    assert_response :success
  end

  test "should get keyword" do
    get accounts_search_keyword_url
    assert_response :success
  end

  test "should get genre" do
    get accounts_search_genre_url
    assert_response :success
  end

  test "should get booking" do
    get accounts_search_booking_url
    assert_response :success
  end

  test "should get detail" do
    get accounts_search_detail_url
    assert_response :success
  end

end
