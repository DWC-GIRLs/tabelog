require 'test_helper'

class Accounts::AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get accounts_accounts_mypage_url
    assert_response :success
  end

  test "should get edit" do
    get accounts_accounts_edit_url
    assert_response :success
  end

  test "should get update" do
    get accounts_accounts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get accounts_accounts_destroy_url
    assert_response :success
  end

  test "should get logout" do
    get accounts_accounts_logout_url
    assert_response :success
  end

  test "should get welcome" do
    get accounts_accounts_welcome_url
    assert_response :success
  end

  test "should get confirm" do
    get accounts_accounts_confirm_url
    assert_response :success
  end

  test "should get goodbye" do
    get accounts_accounts_goodbye_url
    assert_response :success
  end

end
