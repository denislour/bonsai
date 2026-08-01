require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = users(:one) }

  test "create with valid credentials" do
    post api_v1_session_path, params: { email_address: @user.email_address, password: "password" }, as: :json

    assert_response :created
    assert cookies[:session_id].present?
    assert_equal @user.id, response.parsed_body["id"]
    assert_equal @user.email_address, response.parsed_body["email"]
  end

  test "create with invalid credentials" do
    post api_v1_session_path, params: { email_address: @user.email_address, password: "wrong" }, as: :json

    assert_response :unauthorized
    assert_nil cookies[:session_id]
  end

  test "destroy requires authentication" do
    delete api_v1_session_path

    assert_response :unauthorized
  end

  test "destroy" do
    sign_in_as(@user)

    assert_changes -> { Session.count } do
      delete api_v1_session_path
    end

    assert_response :no_content
    assert_empty cookies[:session_id]
  end
end
