require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get home_detail_url
    assert_response :success
  end

end
