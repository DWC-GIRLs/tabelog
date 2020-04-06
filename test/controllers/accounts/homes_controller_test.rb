require 'test_helper'

class Accounts::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get accounts_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get accounts_homes_about_url
    assert_response :success
  end

end
