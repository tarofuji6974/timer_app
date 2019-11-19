require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get post_detail_url
    assert_response :success
  end

end
