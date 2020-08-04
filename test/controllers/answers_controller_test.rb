require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get answer" do
    get answers_answer_url
    assert_response :success
  end

end
