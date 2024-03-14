require "test_helper"

class ExpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get expressions_new_url
    assert_response :success
  end

  test "should get index" do
    get expressions_index_url
    assert_response :success
  end

  test "should get show" do
    get expressions_show_url
    assert_response :success
  end

  test "should get edit" do
    get expressions_edit_url
    assert_response :success
  end
end
