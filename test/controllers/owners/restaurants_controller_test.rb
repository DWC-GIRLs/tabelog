require 'test_helper'

class Owners::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get owners_restaurants_mypage_url
    assert_response :success
  end

  test "should get new" do
    get owners_restaurants_new_url
    assert_response :success
  end

  test "should get create" do
    get owners_restaurants_create_url
    assert_response :success
  end

  test "should get welcome" do
    get owners_restaurants_welcome_url
    assert_response :success
  end

  test "should get edit" do
    get owners_restaurants_edit_url
    assert_response :success
  end

  test "should get update" do
    get owners_restaurants_update_url
    assert_response :success
  end

  test "should get confirm" do
    get owners_restaurants_confirm_url
    assert_response :success
  end

  test "should get goodbye" do
    get owners_restaurants_goodbye_url
    assert_response :success
  end

  test "should get destroy" do
    get owners_restaurants_destroy_url
    assert_response :success
  end

end
