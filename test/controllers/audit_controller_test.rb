require "test_helper"

class AuditControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = Post.create!(title: "Original", body: "Body", user: @user)
  end

  test "versions requires authentication" do
    get api_v1_audit_versions_path

    assert_response :unauthorized
  end

  test "versions lists all events with filters" do
    sign_in_as(@user)
    @post.update!(title: "Updated")

    get api_v1_audit_versions_path, params: { item_type: "Post", item_id: @post.id }

    assert_response :success
    events = response.parsed_body.map { |v| v["event"] }
    assert_includes events, "create"
    assert_includes events, "update"
    assert response.parsed_body.any? { |v| v.dig("changes", "title") }
  end

  test "versions filters by event" do
    sign_in_as(@user)
    @post.update!(title: "Updated")

    get api_v1_audit_versions_path, params: { item_type: "Post", item_id: @post.id, event: "update" }

    assert_response :success
    assert_equal ["update"], response.parsed_body.map { |v| v["event"] }
  end

  test "versions filters by user_id" do
    sign_in_as(@user)
    post api_v1_posts_path, params: { title: "By user", body: "Body" }, as: :json

    get api_v1_audit_versions_path, params: { user_id: @user.id }

    assert_response :success
    assert response.parsed_body.any? { |v| v["user_id"] == @user.id.to_s }
  end

  test "stats requires authentication" do
    get api_v1_audit_stats_path

    assert_response :unauthorized
  end

  test "stats groups by user and item" do
    sign_in_as(@user)
    patch api_v1_post_path(@post), params: { title: "Updated", body: "Body" }, as: :json
    patch api_v1_post_path(@post), params: { title: "Updated again", body: "Body" }, as: :json

    get api_v1_audit_stats_path, params: { item_type: "Post" }

    assert_response :success
    body = response.parsed_body

    by_user = body["by_user"].find { |s| s["user_id"] == @user.id.to_s && s["event"] == "update" }
    assert_equal 2, by_user["count"]

    by_item = body["by_item"].find { |s| s["item_id"] == @post.id && s["event"] == "update" }
    assert_equal 2, by_item["count"]
  end
end
