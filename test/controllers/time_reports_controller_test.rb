require 'test_helper'

class TimeReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get time_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get time_reports_create_url
    assert_response :success
  end

  test "should get edit" do
    get time_reports_edit_url
    assert_response :success
  end

  test "should get update" do
    get time_reports_update_url
    assert_response :success
  end

end
