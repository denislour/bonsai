require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = Post.create!(title: "Post", body: "Body", user: @user)
  end

  test "create requires authentication" do
    post api_v1_post_comments_path(@post), params: { body: "Hi" }, as: :json

    assert_response :unauthorized
  end

  test "create with valid session" do
    sign_in_as(@user)

    assert_changes -> { Comment.count } do
      post api_v1_post_comments_path(@post), params: { body: "Nice post!" }, as: :json
    end

    assert_response :created
    assert_equal "Nice post!", response.parsed_body["body"]
    assert_equal @post.id, response.parsed_body["post_id"]
  end

  test "create returns 404 for missing post" do
    sign_in_as(@user)

    post api_v1_post_comments_path(999_999), params: { body: "Hi" }, as: :json

    assert_response :not_found
  end

  test "create records a paper_trail version with whodunnit" do
    sign_in_as(@user)

    assert_changes -> { PaperTrail::Version.count } do
      post api_v1_post_comments_path(@post), params: { body: "Audited" }, as: :json
    end

    version = PaperTrail::Version.last
    assert_equal "Comment", version.item_type
    assert_equal @user.id.to_s, version.whodunnit
  end
end
