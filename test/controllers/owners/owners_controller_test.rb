require 'test_helper'

class Owners::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get owners_owners_mypage_url
    assert_response :success
  end

  test "should get edit" do
    get owners_owners_edit_url
    assert_response :success
  end

  test "should get update" do
    get owners_owners_update_url
    assert_response :success
  end

end
