require 'test_helper'

class Accounts::BookingHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_booking_histories_index_url
    assert_response :success
  end

  test "should get new" do
    get accounts_booking_histories_new_url
    assert_response :success
  end

  test "should get create" do
    get accounts_booking_histories_create_url
    assert_response :success
  end

end
