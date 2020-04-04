require 'test_helper'

class Accounts::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_reviews_index_url
    assert_response :success
  end

  test "should get new" do
    get accounts_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get accounts_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get accounts_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get accounts_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get accounts_reviews_destroy_url
    assert_response :success
  end

  test "should get rate_create" do
    get accounts_reviews_rate_create_url
    assert_response :success
  end

  test "should get rate_update" do
    get accounts_reviews_rate_update_url
    assert_response :success
  end

end
