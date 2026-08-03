require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = users(:one) }

  test "index is public" do
    get api_v1_posts_path
    assert_response :success
  end

  test "show is public" do
    post = Post.create!(title: "Hello", body: "World", user: @user)

    get api_v1_post_path(post)

    assert_response :success
    assert_equal post.id, response.parsed_body["id"]
  end

  test "create requires authentication" do
    post api_v1_posts_path, params: { title: "X", body: "Y" }, as: :json

    assert_response :unauthorized
  end

  test "create with valid session" do
    sign_in_as(@user)

    post api_v1_posts_path, params: { title: "Hello", body: "World" }, as: :json

    assert_response :created
    assert_equal "Hello", response.parsed_body["title"]
    assert_equal @user.email_address, response.parsed_body.dig("author", "email")
  end

  test "create with invalid title" do
    sign_in_as(@user)

    post api_v1_posts_path, params: { title: "", body: "World" }, as: :json

    assert_response :unprocessable_entity
  end

  test "update requires authentication" do
    post = Post.create!(title: "A", body: "B", user: @user)

    patch api_v1_post_path(post), params: { title: "New" }, as: :json

    assert_response :unauthorized
  end

  test "update with valid session" do
    sign_in_as(@user)
    post = Post.create!(title: "A", body: "B", user: @user)

    patch api_v1_post_path(post), params: { title: "New Title", body: "New Body" }, as: :json

    assert_response :success
    assert_equal "New Title", response.parsed_body["title"]
  end

  test "destroy requires authentication" do
    post = Post.create!(title: "A", body: "B", user: @user)

    delete api_v1_post_path(post)

    assert_response :unauthorized
  end

  test "destroy with valid session" do
    sign_in_as(@user)
    post = Post.create!(title: "A", body: "B", user: @user)

    assert_changes -> { Post.count } do
      delete api_v1_post_path(post)
    end

    assert_response :no_content
  end

  test "show returns 404 for missing post" do
    get api_v1_post_path(999_999)

    assert_response :not_found
  end
end
