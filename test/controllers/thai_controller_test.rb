require 'test_helper'

class ThaiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thai_index_url
    assert_response :success
  end

  test "should get about" do
    get thai_about_url
    assert_response :success
  end

end
