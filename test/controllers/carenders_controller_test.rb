require "test_helper"

class CarendersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get carenders_top_url
    assert_response :success
  end
end
