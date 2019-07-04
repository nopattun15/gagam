require 'test_helper'

class GrowthReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get growth_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get growth_reports_create_url
    assert_response :success
  end

  test "should get edit" do
    get growth_reports_edit_url
    assert_response :success
  end

  test "should get update" do
    get growth_reports_update_url
    assert_response :success
  end

end
