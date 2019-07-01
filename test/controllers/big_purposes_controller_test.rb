require 'test_helper'

class BigPurposesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get big_purposes_index_url
    assert_response :success
  end

  test "should get show" do
    get big_purposes_show_url
    assert_response :success
  end

  test "should get new" do
    get big_purposes_new_url
    assert_response :success
  end

  test "should get edit" do
    get big_purposes_edit_url
    assert_response :success
  end

  test "should get completed" do
    get big_purposes_completed_url
    assert_response :success
  end

end
