require 'test_helper'

class Owners::BookingHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get owners_booking_histories_show_url
    assert_response :success
  end

  test "should get index" do
    get owners_booking_histories_index_url
    assert_response :success
  end

  test "should get update" do
    get owners_booking_histories_update_url
    assert_response :success
  end

end
