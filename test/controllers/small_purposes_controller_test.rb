require 'test_helper'

class SmallPurposesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get small_purposes_index_url
    assert_response :success
  end

  test "should get show" do
    get small_purposes_show_url
    assert_response :success
  end

  test "should get new" do
    get small_purposes_new_url
    assert_response :success
  end

  test "should get create" do
    get small_purposes_create_url
    assert_response :success
  end

  test "should get edit" do
    get small_purposes_edit_url
    assert_response :success
  end

  test "should get update" do
    get small_purposes_update_url
    assert_response :success
  end

  test "should get completed" do
    get small_purposes_completed_url
    assert_response :success
  end

end
