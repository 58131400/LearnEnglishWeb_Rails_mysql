require 'test_helper'

class ClassDbControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get class_db_index_url
    assert_response :success
  end

end
