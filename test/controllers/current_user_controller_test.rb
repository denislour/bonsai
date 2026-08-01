require "test_helper"

class CurrentUserControllerTest < ActionDispatch::IntegrationTest
  test "returns unauthorized without cookie" do
    get api_v1_current_user_path

    assert_response :unauthorized
  end

  test "returns current user with valid cookie" do
    user = users(:one)
    sign_in_as(user)

    get api_v1_current_user_path

    assert_response :success
    assert_equal user.id, response.parsed_body["id"]
  end

  test "returns unauthorized with invalid token" do
    cookies["session_id"] = "invalid-token"

    get api_v1_current_user_path

    assert_response :unauthorized
  end
end
